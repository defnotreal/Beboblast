with (obj_player)
{
	v_spd = 10;
	jumps = 0;
	player_set_state(state_jump);
}

with (obj_game) lvl_totalboxes += (instance_number(obj_box_smallwood) +
								   instance_number(obj_box_smallmetal) +
								   instance_number(obj_box_bigwood) +
								   instance_number(obj_box_bigmetal));