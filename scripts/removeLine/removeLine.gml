function removeLine(x1,y1,x2,y2,rad,ts,sourcerad,targetrad) {
	var safetyreps = 1000;
	var turnstep = 10;
	var turnmax = 120;
	var step = 2;
	var reps = 2;
	
	var curx = x1;
	var cury = y1;
	
	var probstep = 0.02;
	var prob = 0;
	var enddist = targetrad;
	
	var nearenddist = 15;
	var anglediffmax = 5;
	
	var dir = point_direction(x1,y1,x2,y2) + irandom_range(90,-90)*(1-min(1,prob));
	var curdir = point_direction(x1,y1,x2,y2);
	var magmax = point_distance(x1,y1,x2,y2);
	var currad = sourcerad;
	var aimrad = rad;
	var radminmax = 5;
	var countrad = 0;
	var prevx = x1;
	var prevy = y1;
	show_debug_message("===============")
	
	var breakloop = false;
	while((point_distance(x2,y2,curx,cury)>enddist)&&safetyreps>0) {
		while(abs(angle_difference(curdir,dir))>anglediffmax||(min(1,prob)==1)) {
			if((min(1,prob)==1)) {
				curdir = dir;
			}
			
			for(var mag = 0; mag < step*reps; mag+=step) {
				removeCirc(currad, round(curx), round(cury), layer_tilemap_get_id("Blocks"))
				
				curx += lengthdir_x(step,curdir);
				cury += lengthdir_y(step,curdir);
				
				prevx = curx;
				prevy = cury;
				
				if(point_distance(x2,y2,curx,cury)<enddist) {
					breakloop = true;
					break;
				}
				
				if(countrad>0) {
					countrad -= 1;
					if(countrad==0) {
						aimrad = rad;
					}
				}
				if(irandom_range(0,10)==0&&aimrad == rad) {
					aimrad = max(2,rad+clamp(radminmax-rad,0,radminmax)+irandom_range(-radminmax,radminmax))
					countrad = irandom_range(5,10);
				}
				
				if(point_distance(x2,y2,curx,cury)-targetrad <= nearenddist)
					currad = lerp(currad,targetrad,0.05)
				else 
					currad = lerp(currad,aimrad,random_range(0.05,0.2))
				
				if(point_distance(x2,y2,curx,cury)<nearenddist) step = 0.5;
				else step = 2;
			}
			if(breakloop) break;
			removeCirc(currad, round(curx), round(cury), layer_tilemap_get_id("Blocks"))
			
			curdir -= clamp(angle_difference(curdir,dir),-turnstep,turnstep);
		}
		
		if(breakloop) break;
		
		prob+=probstep;
		turnstep = min(turnstep, probstep*20*4+turnstep);
		dir = point_direction(curx,cury,x2,y2) + irandom_range(90,-90)*((point_distance(x2,y2,curx,cury)>nearenddist) ? (1-min(1,prob)) : (5/90));
		safetyreps--;
	}
}