/// @description Init

if (instance_exists(obj_game))		 instance_destroy(obj_game);
if (instance_exists(obj_trans_fade)) instance_destroy(obj_trans_fade);

capture_x	  = 0;
capture_y	  = 0;
capture_scale = 1;