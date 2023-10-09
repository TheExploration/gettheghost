///@description draw

draw_self()


//Flash
if (flashAlpha > 0) {
	shader_set(sh_flash);
	
	draw_sprite_ext(sprite_index, image_index,x,y,image_xscale,image_yscale,image_angle,flashColor,flashAlpha);
	
	shader_reset();
}
if (muzzleflash) {
	draw_sprite(s_muzzleflash, -1, x+gun1, y-5)
	draw_sprite(s_muzzleflash, -1, x+gun2, y-5)
	muzzleflash = false
}