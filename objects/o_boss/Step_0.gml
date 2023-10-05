/// @description Insert description here
// You can write your code in this editor
if (flashAlpha > 0) {
	flashAlpha -=0.5;
}
counter++;
switch (attack_mode)
{
    case 1:
		if (counter < 50) {
			x = o_player.x;
		}
        if (counter==65) {
			with instance_create_layer(x+5,y+5,"Projectile", o_enemybullet) {
				speed = 1.5
				direction = 270;
			}
			with instance_create_layer(x-6,y+5,"Projectile", o_enemybullet) {
				speed =1.5
				direction = 270;
			}
			
		}
		if (counter > 80) {
			if (abs(x - o_player.x) >3 ) {
				
				x = x+ sign(o_player.x-x)*1.5
			} else {
				counter = 0;
			}
		}
		if (counter > 150) {
			if (abs(x - o_player.x) >3 ) {
				
				x = x+ sign(o_player.x-x)*3
			} else {
				counter = 0;
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