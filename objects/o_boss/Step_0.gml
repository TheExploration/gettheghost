/// @description STEP
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
				random_attack();
			}
		}
		if (counter > 180) {
			if (abs(x - player.x) >3 ) {
				
				x = x+ sign(player.x-x)*2.5
			} else {
				counter = 0;
				random_attack()
			}
		}
		if (counter > 240) {
			random_attack()
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
			random_attack()
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
			random_attack()
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
			laser1.image_angle-=1.7
			laser2.image_angle+=1.7
			
		} else if (counter > 370 && counter < 480) {
			laser1.image_angle+=1.7
			laser2.image_angle-=1.7
		}
		else if (counter > 480 && counter < 560) {
			laser1.image_angle-=1.5
			laser2.image_angle+=1.5
		} else if (counter == 590) {
			laser1.image_speed = -3;
			laser2.image_speed = -3;
		} else if (counter > 630) {
			counter = 0;
			random_attack()
		}
		
	break;
	
	case 5:
		if (counter < 120) {
			if (abs(x - player.x) >3 ) {
				
				x = x+ sign(player.x-x)*1.5
			} else {
				
			}
		} else if (counter == 160) {
			audio_play_sound(snd_pentashot, 0 ,false)
			var inner = array_create(12, noone)
			var outer = array_create(13, noone)
			for (var i = 0; i < 12; i++) {
				inner[i] = instance_create_layer(x-6,y+5, "Projectile", o_pentashot) 
				inner[i].direction = 30*i+irandom_range(-2,2);
				inner[i].speed = 0.8+random_range(-0.1,0.1);
				
				inner[i] = instance_create_layer(x+5,y+5, "Projectile", o_pentashot) 
				inner[i].direction = 30*i+irandom_range(-2,2);
				inner[i].speed = 0.8+random_range(-0.1,0.1);
				
				
			}
			for (var i = 0; i < 13; i++) {
				inner[i] = instance_create_layer(x-6,y+5, "Projectile", o_pentashot) 
				inner[i].direction = 28*i+irandom_range(-2,2);
				inner[i].speed = 1.2+random_range(-0.1,0.1);
				
				inner[i] = instance_create_layer(x+5,y+5, "Projectile", o_pentashot) 
				inner[i].direction = 28*i+irandom_range(-2,2);
				inner[i].speed = 1.2+random_range(-0.1,0.1);
				
				
				
				
			}
			
		} else if (counter < 220) {
			if (abs(x - player.x) >3 ) {
				
				x = x+ sign(player.x-x)*1.5
			} else {
				
			}
		} else if (counter == 240) {
			audio_play_sound(snd_pentashot, 0 ,false)
			var inner = array_create(12, noone)
			var outer = array_create(13, noone)
			for (var i = 0; i < 12; i++) {
				inner[i] = instance_create_layer(x-6,y+5, "Projectile", o_pentashot) 
				inner[i].direction = 30*i+irandom_range(-2,2);
				inner[i].speed = 0.8+random_range(-0.1,0.1);
				
				inner[i] = instance_create_layer(x+5,y+5, "Projectile", o_pentashot) 
				inner[i].direction = 30*i+irandom_range(-2,2);
				inner[i].speed = 0.8+random_range(-0.1,0.1);
				
				
			}
			for (var i = 0; i < 13; i++) {
				inner[i] = instance_create_layer(x-6,y+5, "Projectile", o_pentashot) 
				inner[i].direction = 28*i+irandom_range(-2,2);
				inner[i].speed = 1.2+random_range(-0.1,0.1);
				
				inner[i] = instance_create_layer(x+5,y+5, "Projectile", o_pentashot) 
				inner[i].direction = 28*i+irandom_range(-2,2);
				inner[i].speed = 1.2+random_range(-0.1,0.1);
				
				
				
				
			}
			
		} else if (counter > 260 && counter < 300) {
			if (abs(x - player.x) >3 ) {
				
				x = x+ sign(player.x-x)*1.5
			} else {
				
			}
		} else if (counter == 320) {
			audio_play_sound(snd_pentashot, 0 ,false)
			var inner = array_create(12, noone)
			var outer = array_create(13, noone)
			for (var i = 0; i < 12; i++) {
				inner[i] = instance_create_layer(x-6,y+5, "Projectile", o_pentashot) 
				inner[i].direction = 30*i+irandom_range(-2,2);
				inner[i].speed = 0.8+random_range(-0.1,0.1);
				
				inner[i] = instance_create_layer(x+5,y+5, "Projectile", o_pentashot) 
				inner[i].direction = 30*i+irandom_range(-2,2);
				inner[i].speed = 0.8+random_range(-0.1,0.1);
				
				
			}
			for (var i = 0; i < 13; i++) {
				inner[i] = instance_create_layer(x-6,y+5, "Projectile", o_pentashot) 
				inner[i].direction = 28*i+irandom_range(-2,2);
				inner[i].speed = 1.2+random_range(-0.1,0.1);
				
				inner[i] = instance_create_layer(x+5,y+5, "Projectile", o_pentashot) 
				inner[i].direction = 28*i+irandom_range(-2,2);
				inner[i].speed = 1.2+random_range(-0.1,0.1);
				
				
				
				
			}
			
		} else if (counter > 340) {
			counter = 0;
			random_attack();
		}
	break;
	
    default:
	attack_mode = 1
	counter = 0
    break;
}

x=x+hsp
y=y+vsp