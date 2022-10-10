/// @description Init

h_spd = -1;
v_spd = 0;
grav  = 0.4;
dead = false;
damage_cooldown = 60;
damage_timer = 0;

image_speed = 0.1;

function grounded()
{
	return (place_meeting(x, y + 1, par_terrain));	
}

state_free = function()
{
	if (h_spd == 0) h_spd = sign(image_xscale);
	
	if(	collision_point(x+sign(h_spd)*9,y,par_terrain,true,true) == noone &&
		collision_point(x+sign(h_spd)*9,y+1,par_terrain,true,true) == noone)
		{
			h_spd *= -1;
		}
	
	image_xscale = (h_spd != 0) ? -sign(h_spd) : image_xscale;	
	
	if(place_meeting(x,y,obj_player) &&
		(obj_player.state == obj_player.state_dash || obj_player.state == obj_player.state_overdrive))
	{
		dead = true;
	}
	
	if(dead)
	{
		h_spd = 4*sign(obj_player.image_xscale);
		v_spd = -4;
		sprite_index = spr_ballbuster_dead;
		state = state_dead;
	}
	
	damage_timer--;
}

state_dead = function()
{
	if (place_meeting(x, y+1, par_terrain)) instance_destroy(id);	
}

state = state_free;