state();

move();

if (!grounded())
{
	if (v_spd < 8) v_spd += grav;
}
else
{
	v_spd = 0;
}