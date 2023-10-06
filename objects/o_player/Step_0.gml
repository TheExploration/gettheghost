
/// @description STEP
// You can write your code in this editor
if (hp <= 0) {
	has_control = false;
	sprite_index = s_die;
	instance_destroy(o_flame2)
	image_speed = 1;
	if (image_index > image_number-1){
		instance_destroy();
		
	}
}


//Get Input Dodgeroll
if (mouse_check_button_pressed(mb_right) && !roll && has_control) {
	has_control = false;
	roll = true;
	invulnerable = true;
	audio_stop_sound(snd_roll)
	audio_play_sound(snd_roll, 0, false)
	if (hsp < 0) { 
		sprite_index = s_roll2left
		image_index = 1
		image_speed = 1;
	} else if (hsp > 0) {
		sprite_index = s_roll2right
		image_index = 1
		image_speed = 1;
	} else {
		sprite_index = s_roll2
		image_index = 0
		image_speed = 1;
	}
	mask_index=-1
	alarm[1] = 15;
	alarm[2] = 30;
	
	rolldir  = point_direction(0, 0, hsp, vsp); 
	
	
}
if (roll && !has_control) {
	if (hsp != 0 || vsp !=0) {
		hsp = lengthdir_x(1, rolldir)*2.5;
		vsp = lengthdir_y(1, rolldir)*2.5;
	}
}



if (has_control) {
	if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
		shoot_delay = 0;
		
	
		instance_create_layer(x-3, y, "Projectile", o_bullet);
		instance_create_layer(x+2, y, "Projectile", o_bullet);
		audio_play_sound(s_shoot, 1, false);
		screenshake(5, 0.1, 0.05)
	} else if (keyboard_check(vk_space) || mouse_check_button(mb_left)) {

		shoot_delay++;
		if (shoot_delay > 10) {
			instance_create_layer(x+2, y, "Projectile", o_bullet);
			instance_create_layer(x-3, y, "Projectile", o_bullet);
			shoot_delay = 0;
			 audio_play_sound(s_shoot, 1, false);
			 screenshake(5, 0.1, 0.05)
		}
	}
}
//Get Input
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));

if (has_control) {
	//Calculate Movement
	var moveX = right-left;
	var moveY = down-up;

	//Horizontal
	hsp = moveX * move_spd;

	//Vertical
	vsp = moveY * move_spd;

	//Diagonal


	if (hsp != 0 && vsp != 0) {
		hsp = hsp/sqrt(2);
		vsp = vsp/sqrt(2);
	}
	image_index = moveX
}

//Move
move_and_collide(hsp, vsp, o_wall);

//Flash
if (flashing) {
	
	if (flashAlpha > 0) {
		flashAlpha -=0.2;
	} else {
		flashAlpha = 2;
	}
	
} else {
	flashAlpha = 0;
}