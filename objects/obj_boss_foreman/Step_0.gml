x = approach(x, dest_x, apr_spd);

if (!grounded())
{
	if (v_spd < 8) v_spd += 0.4;
}
else
{
	v_spd = 0;
}

switch (part)
{
	case 0:
		if (grounded())
		{
			part++;
			sprite_index = spr_boss_foremanland;
			image_index  = 0;
		}
	break;
	case 1:
		if (image_index >= image_number - 1)
		{
			part++;
			sprite_index = spr_boss_foremanrage;
			image_index  = 0;
		}
	break;
	case 2:
		if (jump_time > 0) jump_time--;
		else
		{
			part++;
			sprite_index = spr_boss_foremanjump;
			image_index = 0;
			move_boss(obj_boss_crane.x, 1.75, -8);
		}
	break;
	case 3:
		if (place_meeting(x, y + 2, obj_boss_crane))
		{
			instance_destroy(self);
		}
	break;
}

move();