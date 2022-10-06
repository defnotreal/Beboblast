x = approach(x, dest_x, 0.2);

if (!grounded())
{
	if (v_spd < 10) v_spd += 0.2;
}
else v_spd = 0;

y += v_spd;