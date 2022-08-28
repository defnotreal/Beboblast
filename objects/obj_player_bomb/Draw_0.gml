draw_sprite_ext(spr_bomb, 0, x, y - (sprite_height / 2) + 1, image_xscale, image_yscale, rotate, c_white, 1);
if (DEBUG) draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 0.5);

with (owner)
{
	if (state == state_carry)
	{
		var xo = 2, yo = 0;
		
		switch (floor(image_index))
		{
			case 0: yo = 1; break;
			case 1: yo = 0; break;
			case 2: yo = 1; break;
			case 3: yo = 0; break;
		}
		
		draw_sprite_ext(spr_player_arm, 0, x + (xo * -image_xscale), (bbox_top + 6) - yo, image_xscale, 1, 0, c_white, 1);
	}
}

draw_set_color(c_red);
draw_circle(x, y + 1, 1, false)
draw_set_color(c_white);