
/// @description Insert description here
// You can write your code in this editor
show_debug_message(gamepad_is_connected(0))

if (gamepad_button_check_pressed(0, gp_face1)) {
	shoot_delay = 0;
	instance_create_layer(x-4, y, "Projectile", o_bullet);
	instance_create_layer(x+3, y, "Projectile", o_bullet);
	audio_play_sound(s_shoot, 1, false);
} else if (gamepad_button_check(0, gp_face1)) {

	shoot_delay++;
	if (shoot_delay > 10) {
		instance_create_layer(x+3, y, "Projectile", o_bullet);
		instance_create_layer(x-4, y, "Projectile", o_bullet);
		shoot_delay = 0;
		 audio_play_sound(s_shoot, 1, false);
	}
}
	
//Get Input

var _dir  = point_direction(0, 0, gamepad_axis_value(0, gp_axislh), gamepad_axis_value(0, gp_axislv)); //lets say the direction from the x,y point to the mouse x, y point are = 40;
var _len = point_distance(0, 0, gamepad_axis_value(0, gp_axislh), gamepad_axis_value(0, gp_axislv));
hsp = lengthdir_x(_len, _dir)*2;
vsp = lengthdir_y(_len, _dir)*2;

if (hsp > 0) {
	image_index = 1;
} else if (hsp < 0){
	image_index = 2;
} else {
	image_index = 0;
}




//Move
move_and_collide(hsp, vsp, o_wall);


