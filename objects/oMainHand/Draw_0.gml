var tempoffsetx = 0;
var tempoffsety = 0;
var temprot = idlerot;

if(curset==-1) curdir = oPlayer.mousedir;
else {
	var data = getPos(curset, curtime);
	curtime += delta_time/1000000;
	
	if(curtime>=array_get(array_get(array_get(attackset,curset),array_length(array_get(attackset,curset))-1),0)) {
		curtime = -1;
		curset = -1;
		attacking = false;
	} else {
		attacking = data.attacking;
		tempoffsetx = data._x*curdir;
		tempoffsety = data._y;
		temprot = data.rot;
	}
}

x = oPlayer.x+offsetx*curdir+tempoffsetx;
y = oPlayer.y+offsety+tempoffsety;

draw_sprite_ext(sprite_index,image_index,x,y,curdir,1,(curdir-1)*180+curdir*temprot,c_white,1)

