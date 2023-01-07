state();

if (obj_game.game_over) instance_destroy(id);

if (state == state_free)
{
	if (grounded())
	{
		y--;
		v_spd = -2;
	}
}

if (!grounded()) v_spd = approach(v_spd, 10, grav);
else
{
	if (state != state_free && state != state_dead)
	{
		state = state_free
		v_spd = 0;
	}
	else if (state == state_dead) instance_destroy(id);
}

move();