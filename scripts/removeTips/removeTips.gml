function removeTips(ts){
	//repeat(5) {
		for(var i = 0; i < tilemap_get_width(ts); i++) {
			for(var j = 0; j < tilemap_get_height(ts); j++) {
				var addext = ((tile_get_index(tilemap_get(ts,i,j+1))==0)+
					(tile_get_index(tilemap_get(ts,i,j-1))==0)+
					(tile_get_index(tilemap_get(ts,i+1,j))==0)+
					(tile_get_index(tilemap_get(ts,i-1,j))==0)
				)*(tile_get_index(tilemap_get(ts,i,j))!=0);
				
				var addint = ((tile_get_index(tilemap_get(ts,i,j+1))!=0)+
					(tile_get_index(tilemap_get(ts,i,j-1))!=0)+
					(tile_get_index(tilemap_get(ts,i+1,j))!=0)+
					(tile_get_index(tilemap_get(ts,i-1,j))!=0)
				)*(tile_get_index(tilemap_get(ts,i,j))==0);
			
				if(addext>=3) {
					tilemap_set(ts,tile_set_empty(tilemap_get(ts,i,j)),i,j)
				}
				
				if(addint>=3) {
					var avgcount = 0;
					var avg = 0;
					
					if(tilemap_get(ts,i,j-1)!=0) {
						avg += tile_get_index(tilemap_get(ts,i,j-1))
						avgcount++;
					}
					if(tilemap_get(ts,i,j+1)!=0) {
						avg += tile_get_index(tilemap_get(ts,i,j-1))
						avgcount++;
					}
					if(tilemap_get(ts,i-1,j)!=0) {
						avg += tile_get_index(tilemap_get(ts,i,j-1))
						avgcount++;
					}
					if(tilemap_get(ts,i+1,j)!=0) {
						avg += tile_get_index(tilemap_get(ts,i,j-1))
						avgcount++;
					}
						
					avg /= avgcount;
					tilemap_set(ts,tile_set_index(tilemap_get(ts,i,j),avg),i,j)
				}
			}
		}
	//}
}