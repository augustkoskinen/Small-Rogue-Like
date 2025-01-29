if(keyboard_check(ord("C"))) {
	camera_set_view_size(view_camera[0],CamW*10,CamH*10);
} else {
	camera_set_view_size(view_camera[0],CamW,CamH);
}

CamW = camera_get_view_width(view_camera[0]);
CamH = camera_get_view_height(view_camera[0]);


x = lerp(x, oPlayer.x + oPlayer.sprite_width/2 - (CamW / 2), .05)
y = lerp(y, oPlayer.y + oPlayer.sprite_height/2 - (CamH / 2), .05)

var ranx = random_range(-oGameControl.shakex*10,oGameControl.shakex*10);
var rany = random_range(-oGameControl.shakey*10,oGameControl.shakey*10);
camera_set_view_pos(
	view_camera[0],
	x+(abs(ranx)<=1 ? 0 : ranx),
	y+(abs(rany)<=1 ? 0 : rany)
);