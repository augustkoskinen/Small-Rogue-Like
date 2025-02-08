function removeCirc(rad, xpos, ypos, ts) {
	var xmax = tilemap_get_width(ts)
	var ymax = tilemap_get_height(ts)
	
	for(var i = max(0,xpos-rad); i < min(xmax,xpos+rad); i++) {
		for(var j = max(0,ypos-rad); j < min(xmax,ypos+rad); j++) {
			var tile = tilemap_get(ts,i,j);
			if(point_distance(i,j,xpos,ypos)<=rad&&tile!=noone&&tile_get_index(tile)!=0) {
				tilemap_set(ts,tile_set_empty(tile),i,j)
			}
		}
	}
}