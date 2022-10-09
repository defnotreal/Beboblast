/// @description Init

h_spd = -1;
v_spd = 0;
grav  = 0.4;

image_speed = 0.1;

function grounded()
{
	return (place_meeting(x, y + 1, par_terrain));	
}

state_free = function()
{
	var t = instance_position(x + (sign(h_spd)), y - 11, par_terrain);
	
	if (t != -4) h_spd *= -1;
	

	image_xscale = -sign(h_spd);
}

state_dead = function()
{
	if (place_meeting(x, y, par_terrain)) instance_destroy(id);	
}

state = state_free;