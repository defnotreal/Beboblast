/// @description Init

obj_game.timer_enabled = false;

score_final = obj_game.lvl_score;
part		= 0;
anim_bg		= false;

bebo_dunk_img	= 0;
bebo_dunk_time	= 2;
bebo_dunk_scale = 0;
bebo_dunk_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 16;
bebo_dunk_v_spd = 0;

welldone_y		  = camera_get_view_y(view_camera[0]) - 32;
welldone_anchor_y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 6);
welldone_v_spd	  = 0;

score_total = 0;
score_shake = 0;
score_alpha = 0;
boxes_total = 0;
boxes_shake = 0;
boxes_alpha = 0;
bonus_shake = 0;
bonus_alpha = 0;
time_final  = (obj_game.timer_min * 60) + obj_game.timer_sec;
time_total  = 0;
time_shake  = 0;
time_alpha  = 0;

wait_time = game_get_speed(gamespeed_fps) / 2;

show_debug_message(get_button_assignment("action1", "kb"))

var bg = layer_create(depth - 1, "ResultsBG"),
	fg = layer_create(depth - 2, "ResultsFG");
	
layer = fg;
var back = layer_background_create(bg, spr_results_bg);

layer_set_visible("ResultsBG", false);

layer_background_htiled(back, true);
layer_background_vtiled(back, true);
layer_background_speed(back, 5);