///@description draw

draw_self()


//Flash
if (flashAlpha > 0) {
	shader_set(sh_flash);
	
	draw_sprite_ext(sprite_index, image_index,x,y,image_xscale,image_yscale,image_angle,flashColor,flashAlpha);
	
	shader_reset();
}