
/// @description Insert description here
// You can write your code in this editor
show_debug_message(gamepad_is_connected(0))

if (hp <= 0) {
	has_control = false;
	sprite_index = s_die;
	instance_destroy(o_flame)
	image_speed = 1;
	if (image_index > image_number-1){
		instance_destroy();
		
	}
}


//Get Input Dodgeroll
if (gamepad_button_check_pressed(0, gp_shoulderr) && !roll && has_control) {
	has_control = false;
	roll = true;
	invulnerable = true;
	audio_stop_sound(snd_roll)
	audio_play_sound(snd_roll, 0, false)
	if (hsp < 0) { 
		sprite_index = s_rollleft
		image_index = 1
		image_speed = 1;
	} else if (hsp > 0) {
		sprite_index = s_rollright
		image_index = 1
		image_speed = 1;
	} else {
		sprite_index = s_roll
		image_index = 0
		image_speed = 1;
	}
	mask_index=-1
	alarm[1] = 15;
	alarm[2] = 30;
	
	rolldir  = point_direction(0, 0, gamepad_axis_value(0, gp_axislh), gamepad_axis_value(0, gp_axislv)); 
	
	
}
if (roll && !has_control) {
	if (hsp != 0 || vsp !=0) {
		hsp = lengthdir_x(1, rolldir)*2.5;
		vsp = lengthdir_y(1, rolldir)*2.5;
	}
}

//Get Input Shooting
if (has_control) {
	if (gamepad_button_check_pressed(0, gp_face1)) {
		shoot_delay = 0;
		instance_create_layer(x-4, y, "Projectile", o_bullet);
		instance_create_layer(x+3, y, "Projectile", o_bullet);
		audio_play_sound(s_shoot, 1, false);
		screenshake(5, 0.1, 0.05)
	} else if (gamepad_button_check(0, gp_face1)) {

		shoot_delay++;
		if (shoot_delay > 10) {
			instance_create_layer(x+3, y, "Projectile", o_bullet);
			instance_create_layer(x-4, y, "Projectile", o_bullet);
			shoot_delay = 0;
			audio_play_sound(s_shoot, 1, false);
			screenshake(5, 0.1, 0.05)
		}
	}
}
	
	
//Get Input Movement
if (has_control) {
	var _dir  = point_direction(0, 0, gamepad_axis_value(0, gp_axislh), gamepad_axis_value(0, gp_axislv)); //lets say the direction from the x,y point to the mouse x, y point are = 40;
	var _len = point_distance(0, 0, gamepad_axis_value(0, gp_axislh), gamepad_axis_value(0, gp_axislv));
	hsp = lengthdir_x(_len, _dir)*move_spd;
	vsp = lengthdir_y(_len, _dir)*move_spd;

	if (hsp > 0) {
		image_index = 1;
	} else if (hsp < 0){
		image_index = 2;
	} else {
		image_index = 0;
	}
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
