with (obj_player)
{
	v_spd = 10;
	jumps = 0;
	player_set_state(state_jump);
}

instance_create_depth(0, 0, 0, obj_tutorial_tps);