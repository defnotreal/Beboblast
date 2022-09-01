function player_set_state(_state)
{
	var old_state_name = obj_player.state_name;
	with (obj_player)
	{
		state = _state;
		if (depth != 0) depth = 0;
		
		show_debug_message(old_state_name + " --> " + state_name)
	}
}