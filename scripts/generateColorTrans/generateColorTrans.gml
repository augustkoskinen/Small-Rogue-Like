function generateColorTrans(map, _x, _y, rad, type){
	var chance = 15;
	
	for(var i = max(0,_x-rad-chance); i < min(tilemap_get_height(map),_x+rad+chance); i++) {
		for(var j = max(0,_y-rad-chance); j < min(tilemap_get_width(map),_y+rad+chance); j++) {
			var tile = tilemap_get(map,i,j);
			if(tile!=noone&&tile_get_index(tile)!=0&&
				irandom_range(0,chance*2-1)<chance+(rad-point_distance(i,j,_x,_y)))
					tilemap_set(map,tile_set_index(tile,type),i,j)
		}
	}
}