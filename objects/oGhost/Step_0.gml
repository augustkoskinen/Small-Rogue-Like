event_inherited();

var pdir = point_direction(x,y,oPlayer.x,oPlayer.y);
x += lengthdir_x(400*delta_time/1000000,pdir)
y += lengthdir_y(400*delta_time/1000000,pdir)