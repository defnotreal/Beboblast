state();	//Call state

randomize();

#region Movement

img_spd = game_get_speed(gamespeed_fps) / ground_spd;

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

if (state != state_stunned)
{
	if (control)
	{
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
			if (state != state_overdrive) && (jumps > 0)
			{
				if (alarm[0] > -1) alarm[0] = -1;
				if(state == state_carry)	player_set_state(state_jump_carry);
				else						player_set_state(state_jump);
				if(state == state_jump_carry) image_index = 2;
				if (grounded()) y--;
				v_spd = -jump_spd;
				jumps--;
				down_thrown = false;
			}
			else
			{
				if (state != state_jump_carry) v_spd = 0
			}
		}
	}
	else h_spd = approach(h_spd, 0, real_fric);
	
	if (h_spd > 8 || h_spd < -8) && (hit_wall()) player_stun();
}

if (state != state_ride)
{
	if (v_spd < grav_max) && (!grounded()) v_spd += grav;
	
	if (grounded())
	{
		if (state == state_jump || state == state_stunned) player_set_state(state_free);
		jumps = 2;	
		if (state == state_jump_carry) player_set_state(state_carry);
		if (state == state_carry) jumps = 1;
	}
	
	if (v_spd > 0)
	{
		if (!grounded()) && (state != state_ridekick)
		{
			if (place_meeting(x, y, obj_player_bomb)) && (y <= (obj_player_bomb.bbox_top + (obj_player_bomb.sprite_height / 8)))
			{
				v_spd = 0;
				player_set_state(state_ride);
				jumps = 1;
			}
		}
	}
}

if (dash_timer > 0) dash_timer--;
else dash = true;

var on_boost = instance_place(x, y + 1, obj_boost_pad);
if (on_boost != noone)
{
	alarm[0] = -1;
	image_xscale = on_boost.image_xscale;
	obj_player.h_spd = 15 * image_xscale;
	player_set_state(state_overdrive);
}

if (h_spd != 0) && (state != state_stunned) image_xscale = sign(h_spd);
if ((cur_spr == spr_player_walk) || (cur_spr == spr_player_carrywalk && grounded())) image_speed = 0.075 * abs(h_spd);
else if (cur_spr == spr_player_jump) || (cur_spr == spr_player_hover) image_speed = 0.5;
move();

#endregion

if (anim_time > 0) anim_time--;
else if (anim_time <= 0)
{
	if(anim_time != -1)
	{
		if (cur_img >= sprite_get_number(cur_spr) - 1) cur_img = 0;
		else cur_img++;
	}
	
	switch (cur_spr)
	{
		case spr_player:			anim_time = 1;				 break;
		case spr_player_walk:	    anim_time = 6;				 break;
		case spr_player_carry:		anim_time = 0;				 break;
		case spr_player_carrywalk:  anim_time = 6;				 break;
		case spr_player_dash:	    anim_time = 2;				 break;
		case spr_player_hover:	    anim_time = 3;				 break;
		case spr_player_jump:	    anim_time = -1;				 break;
		case spr_player_kick:	    anim_time = 0;				 break;
		case spr_player_ride:
			if (h_spd != 0) anim_time = 9 - abs(h_spd);
			else			anim_time = -1;                      break;
		case spr_player_ridekick:   anim_time = 0;				 break;
		case spr_player_throw:	    anim_time = 0;				 break;
		case spr_player_throw_down:	anim_time = 0;				 break;
	}
}

#endregion