/// @description Insert description here
// You can write your code in this editor
if (runOnce) {
	other.hp-=30;
	other.flashAlpha =1;
	runOnce = false;
	audio_play_sound(s_explosion, 1, false);
	alarm[0] = 60;
}