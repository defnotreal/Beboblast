function move()
{
	if (place_meeting(x + h_spd, y, par_terrain))
	{
		y_slope = -0;
		while (place_meeting(x + h_spd, y - y_slope, par_terrain)) &&
		(y_slope <= abs(1 * h_spd)) y_slope++;
		if (place_meeting(x + h_spd, y - y_slope, par_terrain))
		{
			while (!place_meeting(x + sign(h_spd), y, par_terrain)) x += sign(h_spd);
			h_spd = 0;
		}
		else y -= y_slope;
	}

	if (place_meeting(x, y + v_spd, par_terrain))
	{
		while (!place_meeting(x, y + sign(v_spd), par_terrain)) y += sign(v_spd);
		v_spd = 0;
	}

	x += h_spd;
	y += v_spd;
}