switch (state)
{
	case state_carry:
		obj_player_bomb.x = x;
		var add = 0;
		if (sprite_index == spr_player_carrywalk)
		{
			switch (floor(image_index))
			{
				case 0: add = 0; break;
				case 1: add = 1; break;
				case 2: add = 0; break;
				case 3: add = 1; break;
			}
		}
		else add = 0;
		obj_player_bomb.y = bbox_top + add;
	case state_jump_carry:
		obj_player_bomb.x = x;
		var add = 0;
		if (sprite_index == spr_player_carrywalk)
		{
			switch (floor(image_index))
			{
				case 0: add = 0; break;
				case 1: add = 1; break;
				case 2: add = 0; break;
				case 3: add = 1; break;
			}
		}
		else add = 0;
		obj_player_bomb.y = bbox_top + add;
	break;
	case state_ride:
		x = obj_player_bomb.x;
		y = obj_player_bomb.y - (obj_player_bomb.sprite_height) + 3;
	break;
	case state_ridekick:
		x = obj_player_bomb.x;
	break;
}

var cam_y = y - sprite_get_height(spr_player);
cam.x = x;
cam.y = cam_y;

if (layer_exists("BackSigns")) layer_x("BackSigns", (camera_get_view_x(view_camera[0]) / 12) - (camera_get_view_x(view_camera[0]) / 6));					
if (layer_exists("Buildings")) layer_x("Buildings", camera_get_view_x(view_camera[0]) / 2);