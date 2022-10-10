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
	if (h_spd == 0) h_spd = sign(image_xscale);
	
	image_xscale = (h_spd != 0) ? -sign(h_spd) : image_xscale;	
	
	if(place_meeting(x,y,obj_player) && obj_player.state == obj_player.state_dash)
	{
		h_spd = 4*sign(obj_player.image_xscale);
		v_spd = -4;
		sprite_index = spr_ballbuster_dead;
		state = state_dead;
	}
}

state_dead = function()
{
	if (place_meeting(x, y+1, par_terrain)) instance_destroy(id);	
}

state = state_free;