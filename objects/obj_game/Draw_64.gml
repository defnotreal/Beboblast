/// @description HUD

#region Score

align(fa_right, fa_top);

draw_text_transformed(score_x + random_range(-score_shake, score_shake), score_y + random_range(-score_shake, score_shake), string(lvl_score), hud_mult, hud_mult, 0);

if (lvl_scoretoadd > 0)
{
	draw_set_color(c_lime);
	
	draw_text_transformed((score_x - (string_width(lvl_score) / 4)) + random_range(-scoretoadd_shake, scoretoadd_shake), (score_y + 64) + random_range(-scoretoadd_shake, scoretoadd_shake), string("+" + string(lvl_scoretoadd)), hud_mult / 1.5, hud_mult / 1.5, 0);
	
	draw_set_color(c_white);
}

align_reset();

#endregion

#region Timer

if (timer_enabled)
{
	var shk_x = random_range(-timer_shake, timer_shake);
	var shk_y = random_range(-timer_shake, timer_shake);

	draw_sprite_ext(spr_hud_timer, timer_img, timer_x + shk_x, timer_y + shk_y, hud_mult, hud_mult, 0, c_white, 1);
	draw_sprite_ext(spr_hud_timerfire, 0, (timer_firex * hud_mult) + shk_x, (timer_firey * hud_mult) + shk_y, hud_mult, hud_mult, 0, c_white, 1);

	var f_min = timer_min,
		f_sec = timer_sec;

	if (f_sec < 10) f_sec = "0" + string(f_sec);

	var time = string(f_min) + ":" + string(f_sec);

	align(fa_center, fa_middle);

	draw_text_transformed(timer_x + shk_x, timer_y + shk_y, time, hud_mult, hud_mult, 0);

	align_reset();
}

#endregion

#region Debug

if (DEBUG)
{
	align(fa_left, fa_bottom);
	
	with (obj_player)
	{
		var inst, g_state;

		if (state == state_ride) inst = obj_player_bomb.collided;
		else inst = instance_place(x, y + 1, par_terrain);

		if (inst != -4) g_state = string(inst.id) + " (" + object_get_name((inst.object_index)) + ")";
		else g_state = "None";

		var cam_height = camera_get_view_height(view_camera[0]) * 4;

		draw_text(10, cam_height - 90, string(get_button("left")) + ", " +
									   string(get_button("right")) + ", " +
									   string(get_button("action1")) + ", " +
									   string(get_button("action2")) + ", " +
									   string(get_button("pause")));
		draw_text(10, cam_height - 70, state_name);
		draw_text(10, cam_height - 50, g_state);
		draw_text(10, cam_height - 30, string(cam.shake_x) + ", " + string(cam.shake_y));
		draw_text(10, cam_height - 10, string(dash));

		align_reset();
	}
}

#endregion