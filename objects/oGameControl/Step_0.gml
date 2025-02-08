if(shakex > 0) {
	shakex -= 4*delta_time/1000000;
}
if(shakey > 0) {
	shakey -= 4*delta_time/1000000;
}

if(global.started)
	view_visible[0] = true;
else 
	view_visible[0] = false;
	