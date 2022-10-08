switch (state)
{
	case state_carry:
		obj_player_bomb.x	  = x;
		obj_player_bomb.depth = -1;
		var add = 0;
		switch (cur_img)
		{
			case 0: add = 1; break;
			case 1: add = 0; break;
			case 2: add = 1; break;
			case 3: add = 0; break;
		}
		obj_player_bomb.y = bbox_top - add;
	break;
	case state_jump_carry:
		obj_player_bomb.x	  = x;
		obj_player_bomb.depth = -1;
		var add = 0;
		switch (cur_img)
		{
			case 0: add = 1; break;
			case 1: add = 0; break;
			case 2: add = 1; break;
			case 3: add = 0; break;
		}
		obj_player_bomb.y = bbox_top - add;
	break;
	case state_overdrive_carry:
		obj_player_bomb.x = x;
		var add = 0;
		if (cur_spr == spr_player_carrywalk)
		{
			switch (cur_img)
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
	case state_ridekick: x = obj_player_bomb.x; break;
	case state_levelend:
		obj_player_bomb.x = obj_end_explosives.x;
		obj_player_bomb.y = obj_end_explosives.y;
	break;
	
	default: if (instance_exists(obj_player_bomb)) obj_player_bomb.depth = 0; break;
}

var cam_y = obj_player.y - sprite_get_height(spr_player);
cam.x = obj_player.x;
cam.y = cam_y;

if (layer_exists("BackSigns"))		layer_x("BackSigns", (camera_get_view_x(view_camera[0]) / 12) - (camera_get_view_x(view_camera[0]) / 6));
if (layer_exists("BuildingsFront")) layer_x("BuildingsFront", camera_get_view_x(view_camera[0]) / 2);
if (layer_exists("BuildingsBack"))  layer_x("BuildingsBack", camera_get_view_x(view_camera[0]) / 2.1);
if (layer_exists("Pipes"))			layer_x("Pipes", camera_get_view_x(view_camera[0]) / 6);