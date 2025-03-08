offsetx = 40;
offsety = 10;
idlerot = 45;

image_speed = 0

//base conditions:
//0, 0, 0, 0, 1
curdir = 0;
curset = -1;
curtime = -1;
attackset = [//set id, set info
	//0 (basic)
	[//time, xpos, ypos, apparent angle, flipside
		[0, 0, 0, idlerot]
	],
	[//1 (sword 1)
		[0.10, -8, -16, 110],
		[0.20, 16, 0, 15],
		[0.60, 0, 0, idlerot]
	],
];

function attack(set) {
	curset = set;
	curtime = 0;
}

function getPos(set, inptime) {
	var i = 0;
	for(var j = 0; j < array_length(array_get(attackset,set)); j++)
		if(inptime<array_get(array_get(array_get(attackset,set),j),0)) { i = j break; }
	
	var prevset = i == 0 
		? array_get(array_get(attackset,0),0) 
		: array_get(array_get(attackset,set),i-1);
		
	var curset =  array_get(array_get(attackset,set),i);
	
	var ratio = abs((inptime - array_get(prevset,0))/(array_get(curset,0)-array_get(prevset,0)))
	
	//show_debug_message(array_get(prevset,1))
	//show_debug_message(array_get(curset,1))
	show_debug_message(curset)
	show_debug_message(prevset)
	/*show_debug_message(lerp(
			array_get(prevset,1),
			array_get(curset,1),
			ratio
		))*/
	return {
		_x : lerp(
			array_get(prevset,1),
			array_get(curset,1),
			ratio
		),
		_y : lerp(
			array_get(prevset,2),
			array_get(curset,2),
			ratio
		),
		rot : lerp(
			array_get(prevset,3),
			array_get(curset,3),
			ratio
		)
	};
}