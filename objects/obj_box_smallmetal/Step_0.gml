var grounded = instance_place(x, y + 1, par_terrain)

if (grounded == noone)
{
	if (v_spd < 10) v_spd += grav;
}
else v_spd = 0;

if (place_meeting(x, y + 1, obj_player)) instance_destroy(id);

move();