switch (state)
{
	case state_carry:
		bomb.x = x;
		var add = 0;
		if (sprite_index == spr_player_carrywalk)
		{
			switch (image_index)
			{
				case 0: add = 0; break;
				case 1: add = 1; break;
				case 2: add = 0; break;
				case 3: add = 1; break;
			}
		}
		else add = 0;
		bomb.y = bbox_top + add;
	break;
	case state_ride:
		x = bomb.x;
		y = bomb.y - (bomb.sprite_height) + 3;
	break;
	case state_ridekick:
		x = bomb.x;
	break;
}