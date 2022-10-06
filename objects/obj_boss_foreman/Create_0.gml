dest_x = x;
v_spd = 0;
intro = true;
moving = false;

function move_boss(_x)
{
	y--;
	v_spd = -abs((_x - x) / 2);
	dest_x = _x;
}

function grounded()
{
	return place_meeting(x, y + 1, par_terrain);
}

move_boss(x + 64)