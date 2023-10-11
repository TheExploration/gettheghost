// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function random_attack2() {
	if (instance_exists(o_boss2)) {
		with (o_boss2) {
			if (hp < 550) {
				attack_mode = irandom_range(0,5);
			} else {
				attack_mode = 1;
			}
		}
	} 
	
}