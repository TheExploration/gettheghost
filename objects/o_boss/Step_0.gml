/// @description Insert description here
// You can write your code in this editor
if (flashAlpha > 0) {
	flashAlpha -=0.5;
}
counter++;
switch (attack_mode)
{
	case 0:
		if (instance_exists(o_player) && instance_exists(o_player2)) {
			
	        var _follow = irandom_range(1,2)
			if (_follow == 1)	{
				player = o_player
			} else {
				player = o_player2
			}
		} else if (instance_exists(o_player)) {
			player = o_player
		} else {
			player = o_player2
		}
		counter = 0
		attack_mode = irandom_range(1,1);
    break;
	
    case 1:
		if (counter < 90) {
			if (abs(x - player.x) >3 ) {
				
				x = x+ sign(player.x-x)*2.5
			}
		} 
        if (counter==110) {
			with instance_create_layer(x+5,y+5,"Projectile", o_enemybullet) {
				speed = 2
				direction = 270;
			}
			with instance_create_layer(x-6,y+5,"Projectile", o_enemybullet) {
				speed = 2
				direction = 270;
			}
			
		}
		if (counter > 135) {
			if (abs(x - player.x) >3 ) {
				
				x = x+ sign(player.x-x)*1.5
			} else {
				counter = 0;
				attack_mode = 0;
			}
		}
		if (counter > 180) {
			if (abs(x - player.x) >3 ) {
				
				x = x+ sign(player.x-x)*2.5
			} else {
				counter = 0;
				attack_mode = 0;
			}
		}
		
    break;
		
    case 2:
        
    break;

    case 3:
        
    break;

    default:
        
    break;
}