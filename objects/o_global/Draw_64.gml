/// @description Insert description here
// You can write your code in this editor
if (instance_exists(o_player1)) {
	for (var i = 0; i < o_player1.hp; i++) {
		draw_sprite_ext(s_hp, image_index, 30*i+30, 20, 4, 4,0,c_white,1);
		draw_sprite_ext(s_player, 0, 35, 60, 4, 4,0,c_white,1);
	}
} else {
	//nothing
}
if (instance_exists(o_player2)) {
	for (var j = 0; j < o_player2.hp; j++) {
		draw_sprite_ext(s_hp, image_index, 1250-30*j, 20, 4, 4,0,c_white,1);
		draw_sprite_ext(s_player2, 0, 1245, 60, 4, 4,0,c_white,1);
	}
} else  {
	//nothing
}