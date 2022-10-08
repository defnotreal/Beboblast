var cam_x = camera_get_view_x(view_camera[0]),
	cam_y = camera_get_view_y(view_camera[0]),
	cam_w = camera_get_view_width(view_camera[0]),
	cam_h = camera_get_view_height(view_camera[0]);

draw_set_alpha(0.5);
draw_rectangle_color(cam_x, cam_y, cam_x + cam_w, cam_y + cam_h, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

event_inherited();

align(fa_center, fa_middle);
draw_text_outlined(x_pos, y_pos - (cam_h / 4), "PAUSED!", 1, 1, c_white, c_black, 1);
align_reset();