draw_set_alpha(alpha);

draw_rectangle_color(0, 0, camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) * 4),
						   camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) * 4),
						   c_black, c_black, c_black, c_black, false);
					 
draw_set_alpha(1);