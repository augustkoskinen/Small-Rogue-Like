shader_set(shDrawWithColor)
draw_sprite_ext(sDebris,image_index,x,y,1,1,dir,drawColor,(deathtimer==-1?1:deathtimer))
shader_reset()
show_debug_message((deathtimer==-1?1:deathtimer))

x += lengthdir_x(mag*delta_time/1000000,dir);
y += lengthdir_y(mag*delta_time/1000000,dir);

mag*=random_range(.85,.95);

if(mag<=100&&deathtimer==-1) {
	deathtimer = 1;
}
if(deathtimer!=-1) 
	deathtimer -= irandom_range(4,8) * delta_time/1000000;

if(deathtimer<=0&&mag<=.5) {
	instance_destroy();
}