/// @description Init

part		   = -1;
dest_y		   = y;
grav		   = 0.4;
black_alpha    = 1;

bomb_x         = room_width - (room_width / 4);
bomb_anchor_y  = room_height - (room_height / 4);
bomb_y		   = bomb_anchor_y;
bomb_v_spd	   = 0;
bomb_scale	   = 0;
bomb_img	   = 0;
bomb_img_spd   = 1;

bebo_spr	   = spr_menu_bebo1;
bebo_img	   = 0;
bebo_img_spd   = game_get_speed(gamespeed_fps) / 16;
bebo_anchor_y  = bomb_y;
bebo_y		   = bebo_anchor_y;
bebo_v_spd     = 0;

title_x		   = room_width / 4;
title_anchor_y = floor(room_height / 2.5);
title_y		   = -(sprite_get_height(spr_menu_title) * 1.5);
title_v_spd	   = 0;
title_alpha	   = 1;

skip_intro	   = function()
{
	bomb_y	     = bomb_anchor_y;
	bomb_v_spd   = 0;
	bomb_scale   = 1;
	bomb_img	 = 0;
	
	bebo_y	     = bomb_y - (bomb_y / 3);
	bebo_v_spd   = 0;
	bebo_img_spd = game_get_speed(gamespeed_fps) / 6;
	bebo_img	 = 1;
	bebo_spr	 = spr_menu_bebo3;
	
	title_y	    = title_anchor_y;
	title_v_spd = 0;
	
	black_alpha = 0;
	shake_camera(0, 0);
	menu_create(obj_main_menu, room_width / 4, (room_height / 2) + (room_height / 16), fa_center, fa_middle);
	part = 4;
}