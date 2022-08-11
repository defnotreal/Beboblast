switch (state)
{
	case state_free: state = state_carry; break;
	case state_carry:
		anchor_y = y;
		bomb.y = y - 15;
		state = state_ride;
	break;
	case state_ride:
		state = state_free;
		y = anchor_y;
	break;
}