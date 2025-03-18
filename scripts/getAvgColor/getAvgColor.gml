function getAvgColor(map, _x, _y, rad){
	var total = 0;
	var count = 0;
	
	for(var i = max(0,_x-rad); i < min(tilemap_get_height(map),_x+rad); i++) {
		for(var j = max(0,_y-rad); j < min(tilemap_get_width(map),_y+rad); j++) {
			var tile = tilemap_get(map,i,j);
			if(point_distance(i,j,_x,_y)<rad&&tile!=noone&&tile_get_index(tile)!=0) {
				total += tile_get_index(tile);
				count++;
			}
		}
	}
	
	return total/count;
}