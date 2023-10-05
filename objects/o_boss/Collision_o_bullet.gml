/// @description Insert description here
// You can write your code in this editor
hp--;
instance_create_layer(other.x, other.y, "Projectile", o_impact)
audio_play_sound(s_hurt, 1, false);
instance_destroy(other)
flashAlpha = 1;