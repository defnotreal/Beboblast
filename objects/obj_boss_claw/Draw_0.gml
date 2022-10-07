for (var i = 0; i < 11; i++;)
{
	draw_sprite(spr_boss_chain, 0, x, y - (sprite_get_height(spr_boss_chain) * i));
}

draw_self();
draw_sprite_ext(sprite_index, 0, x, y, -1, 1, -image_angle, c_white, 1);
draw_sprite_ext(spr_claw_base, 0, x, y, 1, 1, image_angle, c_white, 1);