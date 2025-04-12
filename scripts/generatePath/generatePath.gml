function generatePath(tsBlocks,tsFloorTiles,tilewidth,tileheight){
	var placeboundary = 60;
	var placeboundaryend = 200;
	
	
	setType(tsBlocks,1);
	setType(tsFloorTiles,1);
	
	var pointxlist = array_create(0);
	var pointylist = array_create(0);
	
	var dirstart = irandom_range(0,-359);
	var lenstart = irandom_range(tilewidth/2-placeboundary,tilewidth/2-placeboundary+10);
	var tilestartx = tilewidth/2 + lengthdir_x(lenstart,dirstart);
	var tilestarty = tileheight/2 + lengthdir_y(lenstart,dirstart);
	
	var dirend = dirstart+180+irandom_range(-placeboundary,placeboundary)
	var lenmax = lineToMin(dirend,tilestartx,tilestarty,0,0,tilewidth,tileheight);
	var lenend = irandom_range(lenmax-placeboundaryend,lenmax-placeboundaryend-50);
	var tileendx = tilestartx+lengthdir_x(lenend,dirend);
	var tileendy = tilestarty+lengthdir_y(lenend,dirend);
	
	for(var i = 1; i <= 7; i++) {
		var rad = round(200*(12-i)/5)+irandom_range(10,-10)
		generateColorTrans(tsBlocks,tileendx,tileendy,rad,round(i),15)
		generateColorTrans(tsFloorTiles,tileendx,tileendy,rad,round(i),15)
	}

	array_push(pointxlist,tilestartx);
	array_push(pointylist,tilestarty);
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
	}
	
	array_push(pointxlist,tileendx);
	array_push(pointylist,tileendy);
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
		,tunnelrad,tsBlocks,tsFloorTiles,sourcerad,targetrad
		)
		
		sourcerad = targetrad;
	}
	
	var reps = irandom_range(4,8)
	for(var i = 0; i < reps; i++) {
		var i1 = irandom_range(0,array_length(pointxlist)-1);
		
		var i2 = i1;
		while(i2 == i1) {
			i2 = irandom_range(0,array_length(pointxlist)-1);
		}
		
		if(i==0) {
			i1 = 2;
			i2 = 4;
		}
		
		var rad1 = irandom_range(3,8);
		var rad2 = irandom_range(3,8);
		
		removeLine(
			array_get(pointxlist,i1),
			array_get(pointylist,i1),
			array_get(pointxlist,i2),
			array_get(pointylist,i2)
		,irandom_range(2,6),tsBlocks,tsFloorTiles,rad1,rad2)
	}
	
	removeTips(tsBlocks);
	
	return {
		startx: tilestartx,
		starty: tilestarty
	}
}