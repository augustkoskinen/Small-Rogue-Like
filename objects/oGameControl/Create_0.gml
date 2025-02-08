global.started = false;

randomize()

var tilex = 6;
var tiley = 6;

global.startx = tilex*64;
global.starty = tiley*64;

removeline(tilex,tiley,tilex+100,tiley+100,6,layer_tilemap_get_id("Blocks"))
drawCirc(5,tilex+100,tiley+100,layer_tilemap_get_id("FloorTiles"),3)

application_surface_draw_enable(false);
u_px = shader_get_uniform(sLightDecay,"u_px");
u_py = shader_get_uniform(sLightDecay,"u_py");
shakex = 0;
shakey = 0;

global.started = true;

function removeline(x1,y1,x2,y2,rad,ts) {
	var safetyreps = 100;
	var turnstep = 10;
	var turnmax = 120;
	var step = 2;
	var reps = 2;
	var dur = irandom_range(5,10)
	
	var curx = x1;
	var cury = y1;
	
	var probstep = 0.05;
	var prob = 0;
	var enddist = 3;
	
	var dir = point_direction(x1,y1,x2,y2) + irandom_range(90,-90)*(1-min(1,prob));
	var curdir = point_direction(x1,y1,x2,y2);
	var magmax = point_distance(x1,y1,x2,y2);
	var currad = irandom_range(-2,2)+rad;
	
	var breakloop = false;
	while((point_distance(x2,y2,curx,cury)>enddist)) {//&&safetyreps>0
		while(dur>0||(min(1,prob)==1)) {
			for(var mag = 0; mag < step*reps; mag+=step) {
				dur -= step;
				removeCirc(currad, round(curx), round(cury), layer_tilemap_get_id("Blocks"))
				curx += lengthdir_x(step,curdir);
				cury += lengthdir_y(step,curdir);
				if(point_distance(x2,y2,curx,cury)<enddist) {
					breakloop = true;
					break;
				}
			}
			if(breakloop) break;
			removeCirc(currad, round(curx), round(cury), layer_tilemap_get_id("Blocks"))
			curdir -= angle_difference(curdir,dir)<=turnstep ? angle_difference(curdir,dir) : sign(angle_difference(curdir,dir))*turnstep;
		}
		if(breakloop) break;
		currad = irandom_range(-2,2)+rad;
		prob+=probstep;
		dir = point_direction(curx,cury,x2,y2) + irandom_range(90,-90)*(1-min(1,prob));
		dur = irandom_range(10,20);
		safetyreps--;
	}
}