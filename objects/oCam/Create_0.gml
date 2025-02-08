CamW = 1600;
CamH = 1600;

//x = global.startx + oPlayer.sprite_width/2 - (CamW / 2);
//y = global.starty + oPlayer.sprite_height/2 - (CamH / 2);

x = oPlayer.x + oPlayer.sprite_width/2 - (CamW / 2)
y = oPlayer.y + oPlayer.sprite_height/2 - (CamH / 2)

camera_set_view_pos(view_camera[0], x, y);