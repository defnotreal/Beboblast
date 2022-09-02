/// @function move();
function move()
{
	repeat(abs(v_spd))
	{
		if (!place_meeting(x, y + sign(v_spd), par_terrain)) y += sign(v_spd);
		else
		{
			if (v_spd == 10) shake_camera(0, 10);
			v_spd = 0;
		}
	}

	repeat(abs(h_spd))
	{
		if (place_meeting(x + sign(h_spd), y, par_terrain)) &&
		   (!place_meeting(x + sign(h_spd), y - 1, par_terrain)) y--;
	   
		if (!place_meeting(x + sign(h_spd), y, par_terrain)) &&
		   (!place_meeting(x + sign(h_spd), y + 1, par_terrain)) &&
		   (place_meeting(x + sign(h_spd), y + 2, par_terrain)) y++;   
	   
		if (!place_meeting(x + sign(h_spd), y, par_terrain)) x += sign(h_spd);
		else h_spd = 0;
	}
}