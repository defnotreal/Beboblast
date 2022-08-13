state();	//Call state

#region Movement

#region Speed

var move_h = (get_button("right") - get_button("left")),
	bbox_side;

if (move_h != 0)
{
	if (state != state_ridekick) && (can_accel()) h_spd += fric * move_h;
}
else
{
	if (state != state_dash) h_spd = max(0, abs(h_spd) - fric) * sign(h_spd);
}

if (get_button("action1"))
{
	if (state == state_ride) state = state_free;
	v_spd = -move_spd;
}

if (get_button("action2"))
{
	if (state == state_free)
	{
		state = state_dash;
		alarm[0] = game_get_speed(gamespeed_fps) / 3;
	}
	else if (state == state_ride)
	{
		state = state_ridekick;
		v_spd = -move_spd / 2;
	}
}

if (state != state_ride)
{
	if (v_spd < 10) v_spd += grav;
	if (state != state_ridekick)
	{
		if (v_spd > 0) && (!grounded())
		{
			if (place_meeting(x, y, bomb)) && (y <= (bomb.bbox_top + (bomb.sprite_height / 4)))
			{
				v_spd = 0;
				state = state_ride;
			}
		}
	}
}

if (state == state_ridekick)
{
	if (y >= bomb.y)
	{
		bomb.h_spd += (move_spd * 2) * image_xscale;
		state = state_free;
	}	
}
if ((h_spd > 8) || (h_spd < -8)) && (place_meeting(x + sign(h_spd), y, par_terrain))
{
	cam.shake = 8;
}

if (h_spd != 0) image_xscale = sign(h_spd);
move();


#endregion

#endregion