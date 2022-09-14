/// @description HUD

#region Score

align(fa_right, fa_top);

draw_text_transformed(score_x, score_y, string(lvl_score), hud_mult, hud_mult, 0);

align_reset();

#endregion

#region Timer

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

#endregion