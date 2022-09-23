/// @description Init

hud_mult	  = 4;

timer_enabled = true;
timer_tick	  = game_get_speed(gamespeed_fps);
timer_min	  = 9;
timer_sec	  = 5;

lvl_score	   = 0;
lvl_scoretoadd = 0;

#region HUD positioning

hp_x		 = display_get_gui_width() / 24;
hp_y		 = display_get_gui_height() / 24;
hp_shake	 = 0;
hp_min_shake = 0;
hp_scale	 = 0;

score_x			 = display_get_gui_width() - (display_get_gui_width() / 24);
score_y			 = hp_y;
score_shake		 = 0;
scoretoadd_shake = 0;
score_timer		 = -1;

timer_x		= display_get_gui_width() / 14;
timer_y		= display_get_gui_height() - (display_get_gui_height() / 8);
timer_firex = 310;
timer_firey = 170;
timer_img   = 0;
timer_shake = 0;

#endregion

#region Functions

function add_score(num)
{
	score_timer		 = game_get_speed(gamespeed_fps);
	scoretoadd_shake = 6;
	lvl_scoretoadd  += num;
}

function set_score()
{
	lvl_score	  += lvl_scoretoadd;
	score_shake	   = 6;
	lvl_scoretoadd = 0;
}

#endregion