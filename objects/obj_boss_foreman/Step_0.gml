x = approach(x, dest_x, apr_spd);


if (!grounded())
{
	if (v_spd < 8) v_spd += 0.4;
}
else
{
	if (part < 3) v_spd = 0;
}

switch (part)
{
	case 0:
		if (grounded())
		{
			part++;
			sprite_index = spr_boss_foremanland;
			image_index  = 0;
			shake_camera(0, 20);
			play_sound("snd_hardland", 0.5, 1.5);
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
			var flat		  = instance_create_layer(4320, 0, "Collisions", obj_terrain_flat);
			flat.image_yscale = 8;
			
			var slope		   = instance_create_layer(4336, 144, "Collisions", obj_terrain_slope1);
			slope.image_xscale = -1;
			slope.image_yscale = -1;
			
			obj_boss_crane.state = obj_boss_crane.state_free;
			instance_create_layer(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2), -sprite_get_height(spr_boss_claw), "Instances", obj_boss_claw);
			instance_destroy(self);
		}
	break;
}

move();