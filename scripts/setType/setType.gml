function setType(ts,type){
	//repeat(5) {
		for(var i = 0; i < tilemap_get_width(ts); i++) {
			for(var j = 0; j < tilemap_get_height(ts); j++) {
				tilemap_set(ts,tile_set_index(tilemap_get(ts,i,j),type),i,j)
			}
		}
	//}
}