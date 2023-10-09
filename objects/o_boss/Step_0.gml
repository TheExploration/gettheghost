/// @description Insert description here
// You can write your code in this editor
if (flashAlpha > 0) {
	flashAlpha -=0.5;
}
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
		attack_mode = irandom_range(1,3);
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
		if (counter < 90) {
			if (abs(x - player.x) >3 ) {
				
				x = x+ sign(player.x-x)*2.5
			}
			
		} 
        if (counter==110) {
			with instance_create_layer(x+5,y+5,"Projectile", o_doubleshot) {
				speed = 2
				direction = 270;
			}
			with instance_create_layer(x-6,y+5,"Projectile", o_doubleshot) {
				speed = 2
				direction = 270;
			}
			
		}
		if (counter > 135) {
			if (abs(x - player.x) >3 ) {
				
				x = x+ sign(player.x-x)*1.5
			} else {
				counter = 0;
				attack_mode = irandom_range(0,3);
			}
		}
		if (counter > 180) {
			if (abs(x - player.x) >3 ) {
				
				x = x+ sign(player.x-x)*2.5
			} else {
				counter = 0;
				attack_mode = irandom_range(0,3)
			}
		}
		
    break;
		
    case 2:
		if (counter < 90) {
			if (abs(x - 85) >3 ) {
				x += sign(85-x)*1.5
				
			}
			
		} 
		if (counter == 120) {
			with instance_create_layer(x+5,y+5,"Projectile", o_split) {
				speed = 3
				direction = 270;
			}
			with instance_create_layer(x-6,y+5,"Projectile", o_split) {
				speed = 3
				direction = 270;
			}
		} else if (counter > 140 && counter < 200) {
			if (abs(x - 170) >3 ) {
				x += sign(170-x)
			}
		} else if (counter == 210) {
			
			with instance_create_layer(x+5,y+5,"Projectile", o_split) {
				speed = 3
				direction = 270;
			}
			with instance_create_layer(x-6,y+5,"Projectile", o_split) {
				speed = 3
				direction = 270;
			}
			
		} else if (counter > 230 && counter < 280) {
			if (abs(x - 255) >3 ) {
				x += sign(255-x)
			}
			
		} else if (counter == 290) {
			with instance_create_layer(x+5,y+5,"Projectile", o_split) {
				speed = 3
				direction = 270;
			}
			with instance_create_layer(x-6,y+5,"Projectile", o_split) {
				speed = 3
				direction = 270;
			}
		} else if (counter > 300) {
			counter =0
			attack_mode = irandom_range(0,3)
		}
        
    break;

    case 3:
		if (counter < 180) {
		    if (abs(x - 5) >3 ) {
				x += sign(5-x)*2
			} else {
				counter = 180
			}
		}
		if (counter > 200 && counter <320) {
			if (counter % 5 ==0) {
				with instance_create_layer(x+5,y+5,"Projectile", o_wave) {
					speed = 1
					direction = irandom_range(250, 290);
				}
				with instance_create_layer(x-6,y+5,"Projectile", o_wave) {
					speed = 1
					direction = irandom_range(250, 290);
				}
			}
			x = x+2;
		}
		if (counter > 320) {
			counter =0
			attack_mode = irandom_range(0,3)
		}
    break;

	case 4:
		
		if (counter < 180) {
			 if (abs(x - 133) >3 ) {
				x += sign(133-x)*2
			} 
		} else if (counter == 200) {
			audio_play_sound(snd_laser, 0, false) 
		laser1 = instance_create_layer(x-5,y+5,"Projectile", o_laser)
					
	
				laser2 = instance_create_layer(x+5,y+5,"Projectile", o_laser) 
					
			
		} else if (counter > 260 && counter < 370) {
			laser1.image_angle--
			laser2.image_angle++
			
		} else if (counter > 370 && counter < 480) {
			laser1.image_angle++
			laser2.image_angle--
		}
		else if (counter > 480 && counter < 560) {
			laser1.image_angle-=1.5
			laser2.image_angle+=1.5
		} else if (counter > 590) {
			laser1.image_speed = -3;
			laser2.image_speed = -3;
		}
		
	break;
	
    default:
        
    break;
}

x=x+hsp
y=y+vsp