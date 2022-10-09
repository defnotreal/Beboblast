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
	var t = place_meeting(x + -sign(image_xscale), y, par_terrain);
	
	if (h_spd == 0) h_spd = sign(image_xscale);
	

	image_xscale = (h_spd != 0) ? -sign(h_spd) : image_xscale;	
}

state_dead = function()
{
	if (place_meeting(x, y, par_terrain)) instance_destroy(id);	
}

state = state_free;