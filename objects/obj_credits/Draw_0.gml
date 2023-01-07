draw_set_color(c_black);

draw_set_alpha(fade_alpha);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

draw_rectangle(0, 0, 80, 360, false);
draw_rectangle(room_width, 0, room_width - 81, 360, false);

draw_set_color(c_white);

switch (part)
{
	case 1:
		if (credit_move > 0) credit_move--;
		else
		{
			part++;
			credit_move = game_get_speed(gamespeed_fps) * 3;
		}
	break;
	case 2:
		align(fa_center, fa_middle);
		draw_text_ext(room_width / 2, room_height - (room_height / 8), text_out, sprite_get_height(spr_font) + 1, 460);
		align_reset();
	break;
	case 3:
		draw_set_color(c_black);
		draw_rectangle(0, 0, room_width, room_height, false);
		draw_set_color(c_white);
		draw_sprite(spr_credits_thankyou, 0, room_width / 2, room_height / 2);
		align(fa_center, fa_bottom);
		draw_text(room_width / 2, room_height - (room_height / 6), "Final Score: " + string(global.gm_score));
		align_reset();
	break;
}