dest_x    = x;
apr_spd   = 0.4;
h_spd	  = 0;
v_spd     = 0;
part	  = 0;
moving    = false;
jump_time = game_get_speed(gamespeed_fps) * 1.5;

image_speed = 0.35;

function move_boss(_x, h, v)
{
	y--;
	v_spd   = v;
	dest_x  = _x;
	apr_spd = h;
}

function grounded()
{
	return place_meeting(x, y + 1, obj_terrain_flat);
}