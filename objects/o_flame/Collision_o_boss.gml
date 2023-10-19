/// @description Insert description here
// You can write your code in this editor
iff (runOnce) {
	other.hp-=30;
	other.flashAlpha =1;
	runOnce = false;
	instance_create_depth(x,y+4, 99, o_burn);
	audio_play_sound(s_explosion, 1, false);
	alarm[0] = 60;
}