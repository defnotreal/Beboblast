/// @description Init

score_final = 0;
part		= 0;
anim_bg		= false;

bebo_dunk_img	= 0;
bebo_dunk_time	= 2;
bebo_dunk_scale = 0;
bebo_dunk_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);
bebo_dunk_v_spd = 0;

welldone_y		  = camera_get_view_y(view_camera[0]) - 32;
welldone_anchor_y = camera_get_view_y(view_camera[0]) + (camera_get_view_y(view_camera[0]) / 4);
welldone_v_spd	  = 0;

score_total = 0;

var bg = layer_create(depth + 1, "ResultsBG"),
	fg = layer_create(depth, "ResultsFG");
	
layer = fg;
var back = layer_background_create(bg, spr_box_metal);

layer_set_visible("ResultsBG", false);

layer_background_htiled(back, true);
layer_background_vtiled(back, true);