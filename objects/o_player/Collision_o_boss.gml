/// @description Insert description here
// You can write your code in this editor
if (!invulnerable) {
	hp--;
	flashing = true
	invulnerable = true;
	audio_play_sound(snd_phurt, 0, false)
	alarm[0] = 60;
	alarm[3] = 40;
}