/// @description Precise positioning shit

switch (state)
{
	case state_carry:
		bomb.x = x;
		bomb.y = bbox_top - (bomb.sprite_height / 2) + 3;
	break;
	case state_ride:
		x = bomb.x;
		y = lerp(y, bomb.y - (bomb.sprite_height / 2) + 3, 0.3);
	case state_ridekick:
		x = bomb.x;
	break;
}