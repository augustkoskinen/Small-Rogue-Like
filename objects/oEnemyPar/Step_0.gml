
if(instance_place(x,y,oMainHand)&&oMainHand.attacking&&cooldown<=0) {
	hp--;
	if(hp<=0) {
		instance_destroy();
	}
	cooldown = cooldownmax
}

if(cooldown>0) {
	cooldown -= delta_time/1000000
}