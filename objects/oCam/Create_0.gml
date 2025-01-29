CamW = 1600;
CamH = 1600;

camera_set_view_pos(
	view_camera[0],
	oPlayer.x + oPlayer.sprite_width/2 - (CamW / 2),
	oPlayer.y + oPlayer.sprite_height/2 - (CamH / 2)
);