/// @description Hurt
if (!invulnerable) {
	hp--
	screenshake(20, 1, 0.3)
	flashing = true;
	alarm[3] = 25;
	invulnerable = true;
	alarm[0] = 60;
	audio_play_sound(snd_phurt, 10, false)
	instance_destroy(other);
}








