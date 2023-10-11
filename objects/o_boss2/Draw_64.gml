/// @description HP BAR


draw_sprite_ext(s_hpbar, image_index, 1250, 500, 5, 5,0,c_white,1);
draw_sprite_stretched(s_hpbarbar, 0, hpX, (hpY+610)-((hp/hp_max)*610), 20, 610*(hp/hp_max));
