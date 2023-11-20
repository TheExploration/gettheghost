if (global.gameover && !runonce) {
	runonce = true;
	alarm[0] = 40
}
if (global.win && !runonce) {
	runonce = true;
	layer_set_visible("WIN", true)
	alarm[1] = 120
}