
/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
	shoot_delay = 0;
	instance_create_layer(x-3, y, "Projectile", o_bullet);
	instance_create_layer(x+2, y, "Projectile", o_bullet);
	audio_play_sound(s_shoot, 1, false);
} else if (keyboard_check(vk_space) || mouse_check_button(mb_left)) {

	shoot_delay++;
	if (shoot_delay > 10) {
		instance_create_layer(x+2, y, "Projectile", o_bullet);
		instance_create_layer(x-3, y, "Projectile", o_bullet);
		shoot_delay = 0;
		 audio_play_sound(s_shoot, 1, false);
	}
}
	
//Get Input
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));

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


//Move
move_and_collide(hsp, vsp, o_wall);


