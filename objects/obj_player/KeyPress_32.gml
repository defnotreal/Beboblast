switch (state)
{
	case state_free:  state = state_carry; break;
	case state_carry:
		anchor_y = y;
		state = state_ride;
	break;
	case state_ride:
		y = anchor_y;
		state = state_free;
	break;
}