if(global.started) {
	var angle = point_direction(oPlayer.x+32,oPlayer.y+32,mouse_x,mouse_y)
	x = 64*round((oPlayer.x+lengthdir_x(64,angle))/64)
	y = 64*round((oPlayer.y+lengthdir_y(64,angle))/64)

	if(mouse_check_button(mb_left)&&usecooldown<=0&&tilemap_get_at_pixel(layer_tilemap_get_id("Blocks"),x,y)!=0) {
		var blocktile = tilemap_get_at_pixel(layer_tilemap_get_id("Blocks"),x,y);
		var damagetile = tilemap_get_at_pixel(layer_tilemap_get_id("BlockDamage"),x,y);
	
		oGameControl.shakex = 1;
		oGameControl.shakey = 1;
	
		//chunks
		var _surf = surface_create(tilemap_get_tile_width(layer_tilemap_get_id("Blocks")), tilemap_get_tile_height(layer_tilemap_get_id("Blocks")),surface_rgba16float);
		surface_set_target(_surf);
		draw_tile(tsBlock, blocktile, 0, 0, 0);
		surface_reset_target();
		var color = surface_getpixel(_surf, 32,32)//surface_getpixel(_surf, irandom_range(0,tilemap_get_tile_width(layer_tilemap_get_id("Blocks"))), irandom_range(0, tilemap_get_tile_height(layer_tilemap_get_id("Blocks"))));
	
	
		var reps = irandom_range(5,10)
		repeat(reps) {
			var debrisinst = instance_create_layer(x+random_range(16,48),y+random_range(16,48),"Debris",oDebris);
			debrisinst.drawColor = make_color_rgb(color[0]*255,color[1]*255,color[2]*255);
			debrisinst.dir = point_direction(x+32,y+32,oPlayer.x+32,oPlayer.y+32)+random_range(45,-45)
		}
		tilemap_set_at_pixel(layer_tilemap_get_id("BlockDamage"),tile_set_index(damagetile,tile_get_index(damagetile)+1),x,y);
		usecooldown = miningmax;
		if(tile_get_index(damagetile)>=4) {
			tilemap_set_at_pixel(layer_tilemap_get_id("BlockDamage"),tile_set_index(damagetile,0),x,y);
			tilemap_set_at_pixel(layer_tilemap_get_id("Blocks"),tile_set_index(blocktile,0),x,y);
		}
	} else if(mouse_check_button(mb_left)&&usecooldown<=0&&tilemap_get_at_pixel(layer_tilemap_get_id("Blocks"),x,y)==0) {
		attackdir = point_direction(oPlayer.x+32,oPlayer.y+32,mouse_x,mouse_y)
		usecooldown = attackingmax;
	}
	
	
	if (usecooldown>0) {
		usecooldown-=delta_time/1000000;
	}
}