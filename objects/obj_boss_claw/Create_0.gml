/// @description Init

dest_x		   = x;
dest_y		   = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 12);
dest_angle	   = 0;
part		   = 0;
timer		   = game_get_speed(gamespeed_fps) * 5;
obj_grabbed = -4;