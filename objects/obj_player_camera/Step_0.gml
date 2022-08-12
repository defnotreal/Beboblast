x = obj_player.x;
y = obj_player.y - (sprite_get_height(spr_player) / 4);

camera_set_view_pos(view_camera[0],
					clamp(x - (camera_get_view_width(view_camera[0]) / 2), 0, room_width),
					clamp(y - (camera_get_view_height(view_camera[0]) / 2), 0, room_height));