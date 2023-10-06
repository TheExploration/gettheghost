/// @description Insert description here
// You can write your code in this editor
if (instance_exists(o_player)) {
	for (var i = 0; i < o_player.hp; i++) {
		draw_sprite_ext(s_hp, image_index, 30*i+30, 20, 4, 4,0,c_white,1);
	}
} else {
}
if (instance_exists(o_player2)) {
	for (var i = 0; i < o_player2.hp; i++) {
		draw_sprite_ext(s_hp, image_index, 1250-30*i, 20, 4, 4,0,c_white,1);
	}
} else  {
}