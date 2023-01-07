/// @description Init

hud_mult	  = 4;
game_over	  = false;
draw_hud	  = true;

timer_enabled = true;
timer_tick	  = game_get_speed(gamespeed_fps);
timer_min	  = 3;
timer_sec	  = 0;

lvl_scoretoadd  = 0;
lvl_totalboxes  = (instance_number(obj_box_smallwood) +
				   instance_number(obj_box_smallmetal) +
				   instance_number(obj_box_bigwood) +
				   instance_number(obj_box_bigmetal));
lvl_boxeskilled = 0;
can_pause		= true;

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

timer_x		   = display_get_gui_width() / 14;
timer_y		   = display_get_gui_height() - (display_get_gui_height() / 8);
timer_firex    = 100;
timer_firey    = 169;
timer_fireimg  = 0;
timer_fireanim = 5;
timer_img      = 8;
timer_shake    = 0;

#endregion

#region Functions

function set_gameover()
{
	audio_stop_all();
	play_sound("snd_punch", 0.5, 1);
	game_over		= true;
	can_pause		= false;
	global.gm_score = 0;
	if (instance_exists(obj_boss_claw)) instance_destroy(obj_boss_claw);
	instance_deactivate_object(obj_player);
	instance_deactivate_object(obj_player_bomb);
	instance_deactivate_layer("Instances");
	shake_camera(50, 50);
	alarm[0] = game_get_speed(gamespeed_fps) * 3;
	
	with (obj_ballbuster) instance_destroy(id);
	with (obj_trashtalker) instance_destroy(id);
}

function add_score(num)
{
	score_timer		 = game_get_speed(gamespeed_fps);
	scoretoadd_shake = 6;
	lvl_scoretoadd  += num;
}

function set_score()
{
	global.gm_score	+= lvl_scoretoadd;
	score_shake	     = 6;
	lvl_scoretoadd   = 0;
}

#endregion