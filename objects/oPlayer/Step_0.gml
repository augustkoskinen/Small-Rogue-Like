var _dt = delta_time/1000000;

var rl = 0;
var du = 0;
if(global.started) {
	rl = keyboard_check(ord("D"))-keyboard_check(ord("A"))
	du = keyboard_check(ord("S"))-keyboard_check(ord("W"))
}

var addx = 0;
var addy = 0;
if(rl!=0||du!=0) {
	dir = round(point_direction(0,0,rl,du))
	
	addx = _dt*lengthdir_x(!keyboard_check(vk_control) ? MOVE_SPEED : MOVE_SPEED*10,dir)
	addy = _dt*lengthdir_y(!keyboard_check(vk_control) ? MOVE_SPEED : MOVE_SPEED*10,dir)
}

if (addx != 0 || addy != 0){
	if(collision_line(x+addx,y,x,y,oEnvironmentPar,true,true)||
		collision_line(x+addx,y,x,y,layer_tilemap_get_id("Blocks"),true,true)||
		place_meeting(x+addx,y,oEnvironmentPar)||
		place_meeting(x+addx,y,layer_tilemap_get_id("Blocks"))
	) {
		while (!collision_line(x+0.5*(addx/abs(addx)),y,x,y,oEnvironmentPar,true,true)&&
			!collision_line(x+0.5*(addx/abs(addx)),y,x,y,layer_tilemap_get_id("Blocks"),true,true)&&
			!place_meeting(x+0.5*(addx/abs(addx)),y,oEnvironmentPar)&&
			!place_meeting(x+0.5*(addx/abs(addx)),y,layer_tilemap_get_id("Blocks"))
		) {
			x += 0.5*(addx/abs(addx));
		}
		addx = 0;
	}
	x += addx;
	
	if(collision_line(x,y+addy,x,y,oEnvironmentPar,true,true)||
		collision_line(x,y+addy,x,y,layer_tilemap_get_id("Blocks"),true,true)||
		place_meeting(x,y+addy,oEnvironmentPar)||
		place_meeting(x,y+addy,layer_tilemap_get_id("Blocks"))
	) {
		while (!collision_line(x,y+0.5*(addy/abs(addy)),x,y,oEnvironmentPar,true,true)&&
			!collision_line(x,y+0.5*(addy/abs(addy)),x,y,layer_tilemap_get_id("Blocks"),true,true)&&
			!place_meeting(x,y+0.5*(addy/abs(addy)),oEnvironmentPar)&&
			!place_meeting(x,y+0.5*(addy/abs(addy)),layer_tilemap_get_id("Blocks"))
		) {
			y += 0.5*(addy/abs(addy));
		}
		addy = 0;
	}
	y += addy;
}