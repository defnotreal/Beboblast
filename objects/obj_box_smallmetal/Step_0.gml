var grounded = instance_place(x, y + 1, par_terrain)

if (grounded == noone)
{
	if (v_spd < 10) v_spd += grav;
}
else v_spd = 0;

move();