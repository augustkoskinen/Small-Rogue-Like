function generatePath(tsBlocks,tsFloorTiles,tilewidth,tileheight){
	var placeboundary = 60;
	
	
	setType(tsBlocks,6);
	setType(tsFloorTiles,1);
	
	var pointxlist = array_create(0);
	var pointylist = array_create(0);
	
	var dirstart = irandom_range(0,-359);
	var lenstart = irandom_range(tilewidth/2-placeboundary,tilewidth/2-placeboundary+10);
	var tilestartx = tilewidth/2 + lengthdir_x(lenstart,dirstart);
	var tilestarty = tileheight/2 + lengthdir_y(lenstart,dirstart);
	
	var dirend = dirstart+180+irandom_range(-placeboundary,placeboundary)
	var lenmax = lineToMin(dirend,tilestartx,tilestarty,0,0,tilewidth,tileheight);
	var lenend = irandom_range(lenmax-placeboundary*1.5,lenmax-placeboundary*1.5+10);
	var tileendx = tilestartx+lengthdir_x(lenend,dirend);
	var tileendy = tilestarty+lengthdir_y(lenend,dirend);
	
	array_push(pointxlist,tilestartx);
	array_push(pointylist,tilestarty);
	drawCirc(10,tilestartx,tilestarty,tsFloorTiles,5)
	removeCirc(6,tilestartx,tilestarty,tsBlocks)
	
	repeat(irandom_range(4,6)) {
		var dist = 0;
		var spacing = 50;
		
		var xpos = 0;
		var ypos = 0;
		
		while(dist<spacing) {
			
			dist = 100000000000;
			for(var i = 0; i< array_length(pointxlist); i++) {
				var curdist = point_distance(xpos,ypos,array_get(pointxlist,i),array_get(pointylist,i))
				if(curdist<dist) dist = curdist;
			}
			xpos = irandom_range(placeboundary,tilewidth-placeboundary);
			ypos = irandom_range(placeboundary,tileheight-placeboundary);
		}
		array_push(pointxlist,xpos)
		array_push(pointylist,ypos)
		
		drawCirc(10,xpos,ypos,tsFloorTiles,4)
	}
	
	array_push(pointxlist,tileendx);
	array_push(pointylist,tileendy);
	drawCirc(10,tileendx,tileendy,tsFloorTiles,3)
	removeCirc(10,tileendx,tileendy,tsBlocks)
	
	var curi = array_length(pointxlist)-1;
	
	
	var sourcerad = 10;
	while(curi>0) {
		var oldi = curi;
		curi -= irandom_range(1,2);
		curi = max(0,curi);
		
		var targetrad = irandom_range(2,6)
		var tunnelrad = targetrad
		if(curi==0) {
			targetrad = 6;
		}
		
		removeLine(
			array_get(pointxlist,oldi),
			array_get(pointylist,oldi),
			array_get(pointxlist,curi),
			array_get(pointylist,curi)
		,tunnelrad,tsBlocks,sourcerad,targetrad
		)
		
		sourcerad = targetrad;
	}
	
	repeat(irandom_range(4,8)) {
		var i1 = irandom_range(0,array_length(pointxlist)-1);
		
		var i2 = i1;
		while(i2 == i1) {
			i2 = irandom_range(0,array_length(pointxlist)-1);
		}
		
		removeLine(
			array_get(pointxlist,i1),
			array_get(pointylist,i1),
			array_get(pointxlist,i2),
			array_get(pointylist,i2)
		,irandom_range(2,6),tsBlocks,4,4)
	}
	
	removeTips(tsBlocks);
	
	return {
		startx: tilestartx,
		starty: tilestarty
	}
}