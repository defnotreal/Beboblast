camera_set_view_pos(view_camera[0],
					(clamp(x - (camera_get_view_width(view_camera[0]) / 2), 0, room_width)) + random_range(-shake_x, shake_x),
					(clamp(y - (camera_get_view_height(view_camera[0]) / 2), 0, room_height - camera_get_view_height(view_camera[0]))) + random_range(-shake_y, shake_y));

shake_x = lerp(shake_x, 0, 0.1);
shake_y = lerp(shake_y, 0, 0.1);