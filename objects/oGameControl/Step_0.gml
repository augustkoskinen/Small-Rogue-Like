if(shakex > 0) {
	shakex -= 4*delta_time/1000000;
}
if(shakey > 0) {
	shakey -= 4*delta_time/1000000;
}

if(global.started)
	view_visible[0] = true;
else 
	view_visible[0] = false;
	
if(keyboard_check_pressed(ord("X"))) {
	var start = generatePath(layer_tilemap_get_id("Blocks"),layer_tilemap_get_id("FloorTiles"),tilewidth,tileheight)
	oPlayer.x = start.startx*64
	oPlayer.y = start.starty*64
}