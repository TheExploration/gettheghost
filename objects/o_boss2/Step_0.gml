/// @description STEP
// You can write your code in this editor
if (flashAlpha > 0) {
	flashAlpha -=0.5;
}

if (hp > 0 ) {

	if (!instance_exists(o_player1) || !instance_exists(o_player2)) {	
		    if (instance_exists(o_player1)) {
				player = o_player1
			} else if (instance_exists(o_player2)) {
				player = o_player2
			} else {
				player = noone
				attack_mode = 0;
				global.gameover = true
			}
	}



	counter++;
	switch (attack_mode)
	{
		case 0:
			random_attack();
			counter = 0
			if (instance_exists(o_player1) && instance_exists(o_player2)) {
			
		        var _follow = irandom_range(1,2)
				if (_follow == 1)	{
					player = o_player1
				} else {
					player = o_player2
				}
			} else if (instance_exists(o_player1)) {
				player = o_player1
			} else if (instance_exists(o_player2)) {
				player = o_player2
			} else {
				player = noone
				attack_mode = 0
			}
		
		
	    break;
	
	    case 1:
			
	    break;
		
	    case 2:
			
	    break;

	    case 3:
			
	    break;

		case 4:
		
			
		
		break;
	
		case 5:
			
		break;
	
	    default:
		attack_mode = 1
		counter = 0
	    break;
	}

	x=x+hsp
	y=y+vsp

} else {
	if (!dieOnce) {
		dieOnce = true;
		alarm[10] = 180;
		counter = 0;
	}
	counter++;
	if (counter % 30 == 0) {
		instance_create_depth(x+irandom_range(-5,5), y+irandom_range(-5,5), 100, o_burn)
		
		audio_stop_sound(s_explosion);
		audio_play_sound(s_explosion, 1, false);
	}

}