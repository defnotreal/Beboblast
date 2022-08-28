state();	//Call state

randomize();

#region Movement

#region Speed

var real_spd, real_fric;

if (!grounded())
{
	if (state == state_ride) || (state == state_dash)
	{
		real_spd  = ground_spd * 2;
		real_fric = 0.1;			
	}
	else
	{
		real_spd  = air_spd;
		real_fric = air_fric;
	}
}
else
{
	real_spd  = ground_spd;
	real_fric = ground_fric;
}

if (get_button("right"))
{
	if (h_spd < 0) h_spd = approach(h_spd, 0, real_fric);
	h_spd = approach(h_spd, real_spd, real_fric);
}
else if (get_button("left"))
{
	if (h_spd > 0) h_spd = approach(h_spd, 0, real_fric);
	h_spd = approach(h_spd, -real_spd, real_fric);
}
else 
{
	if (state != state_ride)
	{
		if (!get_button("right") && !get_button("left")) h_spd = approach(h_spd, 0, real_fric);
	}
	else h_spd = approach(h_spd, 0, real_fric);
}

if (get_button_pressed("action1"))
{
	if (jumps > 0)
	{
		player_set_state(state_jump);
		if (grounded()) y--;
		v_spd = -jump_spd;
		jumps--;
	}
}
else if (get_button_released("action1"))
{
	if (state == state_jump) && (v_spd > 0)
	{
		v_spd = 0;	
	}
}

if (state != state_ride)
{
	if (v_spd < grav_max) && (!grounded()) v_spd += grav;
	else if (grounded())
	{
		if (state == state_jump) player_set_state(state_free);
		jumps = 2;	
	}
	if (v_spd > 0)
	{
		if (!grounded()) && (state != state_ridekick)
		{
			if (place_meeting(x, y, bomb)) && (y <= (bomb.bbox_top + (bomb.sprite_height / 8)))
			{
				v_spd = 0;
				player_set_state(state_ride);
				jumps = 1;
			}
		}
	}
}

if ((h_spd > 8) || (h_spd < -8)) && (hit_wall())
{
	cam.shake_y = 8;
}

if (h_spd != 0) image_xscale = sign(h_spd);
if (sprite_index == spr_player_walk) || (sprite_index == spr_player_carrywalk) image_speed = 0.075 * abs(h_spd);
else if (sprite_index == spr_player_jump) || (sprite_index == spr_player_hover) image_speed = 0.5;
move();

#endregion

#endregion