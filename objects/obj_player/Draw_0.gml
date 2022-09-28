if (anim_time > 0) anim_time--;
else if (anim_time == 0)
{
	if (cur_img == sprite_get_number(cur_spr) - 1) cur_img = 0;
	else cur_img++;
	
	switch (cur_spr)
	{
		case spr_player:			anim_time = 1;				 break;
		case spr_player_walk:	    anim_time = 6;				 break;
		case spr_player_carrywalk:  anim_time = 6;				 break;
		case spr_player_dash:	    anim_time = 2;				 break;
		case spr_player_hover:	    anim_time = 3;				 break;
		case spr_player_jump:	    anim_time = -1;				 break;
		case spr_player_kick:	    anim_time = 0;				 break;
		case spr_player_ride:
			if (h_spd != 0) anim_time = 9 - abs(h_spd);
			else			anim_time = -1;                      break;
		case spr_player_ridekick:   anim_time = 0;				 break;
		case spr_player_throw:	    anim_time = 0;				 break;
		case spr_player_throw_down:	anim_time = 0;				 break;
	}
}

if (state == state_overdrive || state == state_overdrive_carry) gpu_set_fog(true, c_white, 0, 0);
draw_sprite_ext(cur_spr, cur_img, x, y, image_xscale, 1, 0, c_white, 1);
gpu_set_fog(false, c_white, 0, 0);

if (!global.debug) exit;

draw_self();

align(fa_right, fa_bottom);
draw_text(x - 17, y - (sprite_height) - 1, string(h_spd));
align(fa_left, fa_bottom);
draw_text(x + 17, y - (sprite_height) - 1, string(v_spd));
align(fa_center, fa_bottom);
draw_text(x, y - (sprite_height) - 17, string(ground_spd));

align(fa_center, fa_middle);

draw_circle_color(x + (16 * sign(h_spd)), y + 1, 1, c_red, c_red, false)