function lineToMin(dir,x1,y1,xmin,ymin,xmax,ymax){
	var iterate = 0.05;
	
	var curx = x1;
	var cury = y1;
	
	while(xmin<curx&&xmax>curx&&ymin<cury&&ymax>cury) {
		curx += lengthdir_x(iterate,dir);
		cury += lengthdir_y(iterate,dir);
	}
	
	return point_distance(curx,cury,x1,y1);
}