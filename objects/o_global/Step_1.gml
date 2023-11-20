if (global.gameover && !runonce) {
	runonce = true;
	alarm[0] = 40
}
if (global.win && !runonce) {
	runonce = true;
	audio_play_sound(avii, 10, false)
	screenshake(30, 2, 1)
	layer_set_visible("WIN", true)
	alarm[1] = 300
}