function player_set_state(_state)
{
	with (obj_player)
	{
		state = _state;
		if (depth != 0) depth = 0;
		anim_time = 1;
	}
}