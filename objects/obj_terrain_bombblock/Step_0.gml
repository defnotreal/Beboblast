if (place_meeting(x, y, obj_player)) with (obj_player)
{
	if (state == state_carry)			player_set_state(state_free);
	else if (state == state_jump_carry)	player_set_state(state_jump);
}

if (obj_player.state == obj_player.state_carry ||
	obj_player.state == obj_player.state_jump_carry) trigger = true;
else trigger = false;

switch (trigger)
{
	case false: image_xscale = 0; break;
	case true:  image_xscale = 1; break;
}