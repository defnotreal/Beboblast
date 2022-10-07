switch (part)
{
	case 0:
		if (y == dest_y) part++;
	break;
	case 1:
		if (x != obj_player_bomb.x) x = approach(x, obj_player_bomb.x, 4);
		else x = obj_player_bomb.x;
		
		if (timer > 0) timer--;
		else
		{
			part++;
			dest_y = obj_player_bomb.y - sprite_get_height(spr_bomb);
			timer = game_get_speed(gamespeed_fps) * 5;
		}
	break;
	case 2:
		dest_angle = 60;
		if (y == dest_y) part++;
	break;
	case 3:
		dest_angle = 0;
		if (image_angle == dest_angle)
		{
			if (x == clamp(x, x - 10, x + 10)) && (y == obj_player_bomb.y - sprite_get_height(spr_bomb))
			{
				part++;
				obj_grabbed				   = obj_player_bomb;
				if (obj_player.state == obj_player.state_carry ||
					obj_player.state == obj_player.state_jump_carry) player_set_state(obj_player.state_free);
				obj_player_bomb.dmg_player = true;
				dest_y		= camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 12);
			}
			else
			{
				part = 9;
				dest_y = -sprite_height;
			}
		}
	break;
	case 4:
		if (y == dest_y) part++;
	break;
	case 5:
		if (x != obj_player.x) x = approach(x, clamp(obj_player.x, 4078, room_width - (sprite_get_width(spr_bomb) / 2)), 3.5);
		else x = obj_player.x;
		
		if (timer > 0) timer--;
		else
		{
			part = 9;
			obj_grabbed = -4;
			dest_y = -sprite_height;
			dest_angle = 60;
			timer = game_get_speed(gamespeed_fps) * 5;
		}
	break;
	case 9:
		if (y == dest_y) instance_destroy(self);
	break;
}

y = approach(y, dest_y, 1);
image_angle = approach(image_angle, dest_angle, 2);