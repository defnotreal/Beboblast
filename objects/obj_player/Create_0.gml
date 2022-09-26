/// @description Init

#region Movement

h_spd   = 0;
v_spd   = 0;
dash    = true;
control = true;
hp		= 4;

multi = 1;

ground_spd		 = 4	* multi;
air_spd			 = 4	* multi;
jump_spd		 = 4	* multi;
ground_fric      = 0.5  * multi;
air_fric         = 0.35 * multi;
grav			 = 0.2  * multi;
grav_max		 = 10   * multi;
dash_timer		 = 0;

jumps = 2;

#endregion

#region Gameplay

cam		    = instance_create_depth(0, 0, 0, obj_camera);

image_speed = 0.5;

#endregion

#region States

state_name = "";

function grounded()
{
	return place_meeting(x, y + 1, par_terrain);	
}
function hit_wall()
{
	if (place_meeting(x + sign(h_spd), y, obj_terrain_flat) || place_meeting(x + sign(h_spd), y, obj_terrain_bump)) return true;
	return false;
}
function bomb_hit_wall()
{
	with (obj_player_bomb) if (place_meeting(x + sign(h_spd), y, obj_terrain_flat) || place_meeting(x + sign(h_spd), y, obj_terrain_bump)) return true;
	return false;
}
function can_accel()
{
	if (h_spd < ground_spd) && (h_spd > -ground_spd) return true;
	return false;
}
function player_stun()
{
	alarm[0] = -1;
	y--;
	shake_camera(1, 1);
	x -= 2 * sign(h_spd);
	h_spd = -3 * sign(h_spd);
	v_spd = -3;
	image_xscale = 1 * sign(h_spd);
	player_set_state(state_stunned);	
}

state_free = function()
{
	state_name = "state_free";
	
	if (h_spd != 0) sprite_index = spr_player_walk;
	else sprite_index = spr_player;
	move_spd = 4;
	fric = 0.4;
	
	if (get_button_pressed("action2"))
	{
		if (place_meeting(x, y, obj_player_bomb)) player_set_state(state_carry);
		else
		{
			if (dash)
			{
				dash = false;
				alarm[0] = game_get_speed(gamespeed_fps) / 2;
				player_set_state(state_dash);
			}
		}
	}
}

state_jump = function()
{
	state_name = "state_jump";
	
	if(!down_thrown)
	{
		if (jumps > 0) sprite_index = spr_player_jump;
		else sprite_index = spr_player_hover;
	}
	
	if (sprite_index == spr_player_jump)
	{
		if (v_spd > 0) image_index = 1;
		else image_index = 0;
	}
	else if(sprite_index == spr_player_throw_down && v_spd > 0) down_thrown = false;
}

state_dash = function()
{
	state_name = "state_dash";
	
	sprite_index = spr_player_dash;
	image_speed = 0.075 * abs(h_spd);
	h_spd = 10 * image_xscale;
	
	if (place_meeting(x, y, obj_player_bomb))
	{
		alarm[0] = -1;
		dash = true;
		player_set_state(state_carry);
	}
	
	make_trail(sprite_index, floor(image_index), choose(c_red, c_blue, c_green));
	
	if (grounded)
	{
		var slope_l, slope_s1, slope_s2, slope_next;
		slope_l	 = instance_place(x, y + 1, obj_terrain_slope1);
		slope_s1 = instance_place(x, y + 1, obj_terrain_slope2_1);
		slope_s2 = instance_place(x, y + 1, obj_terrain_slope2_2);
		
		if (slope_l != -4) && (slope_l.image_xscale = -image_xscale)
		{
			slope_next = instance_position(slope_l.x - (8 * slope_l.image_xscale), y - 8, par_terrain);

			if (slope_next == -4 || slope_next.object_index = obj_terrain_slope2_1)
			{
				var side;
				
				if (x != slope_l.x) && (y >= slope_l.y + 1) v_spd = -(abs(h_spd));
			}
		}
		else if (slope_s1 != -4) && (slope_s1.image_xscale = -image_xscale)
		{
			slope_next = instance_position(slope_s1.x - (8 * slope_s1.image_xscale), y - 4, par_terrain);

			if (slope_next == -4)
			{
				if (x != slope_s1.x) && (y >= slope_s1.y + 1) v_spd = -(abs(h_spd)) / 2;
			}
		}
		else if (slope_s2 != -4) && (slope_s2.image_xscale = -image_xscale)
		{
			slope_next = instance_position(slope_s2.x - (8 * slope_s2.image_xscale), y - 8, par_terrain);

			if (slope_next == -4)
			{
				if (x != slope_s2.x) && (y >= slope_s2.y + 1) v_spd = -(abs(h_spd)) / 2;
			}
		}
	}
	
	var hit_smallwood  = instance_place(x + sign(h_spd), y, obj_box_smallwood),
		hit_smallmetal = instance_place(x + sign(h_spd), y, obj_box_smallmetal),
		hit_bigwood	   = instance_place(x + sign(h_spd), y, obj_box_bigwood),
		hit_cage	   = instance_place(x + sign(h_spd), y, obj_wood_cage);
	if (hit_smallwood != noone)
	{
		show_debug_message("Box hit");
		instance_destroy(hit_smallwood);
		shake_camera(2, 2);
	}
	else if (hit_smallmetal != noone)
	{
		show_debug_message("Box hit")
		player_stun();
	}
	else if (hit_cage != noone)
	{
		show_debug_message("Box hit")
		hit_cage.hp--;
		if (hit_bigwood.hp > 0) player_stun();
		else 
		{
			player_stun();
			shake_camera(3, 3);
		}
	}
	else if (hit_bigwood != noone)
	{
		show_debug_message("Box hit")
		hit_bigwood.hp--;
		if (hit_bigwood.hp > 0) player_stun();
		else
		{
			instance_destroy(hit_bigwood);
			shake_camera(3, 3);
		}
	}
	else
	{
		if (hit_wall()) player_stun();
	}
}

state_overdrive = function()
{
	state_name = "state_overdrive";
	
	shake_camera(1, 1);
	sprite_index = spr_player_dash;
	move_spd = 15;
	h_spd = move_spd * image_xscale;
	image_speed = 0.075 * abs(h_spd);
	
	make_trail(sprite_index, floor(image_index), c_yellow, 0.75);
	
	if (grounded)
	{
		var slope_l, slope_s1, slope_s2, slope_next;
		slope_l	 = instance_place(x, y + 1, obj_terrain_slope1);
		slope_s1 = instance_place(x, y + 1, obj_terrain_slope2_1);
		slope_s2 = instance_place(x, y + 1, obj_terrain_slope2_2);
		
		if (slope_l != -4) && (slope_l.image_xscale = -image_xscale)
		{
			slope_next = instance_position(slope_l.x - (8 * slope_l.image_xscale), y - 8, par_terrain);

			if (slope_next == -4 || slope_next.object_index = obj_terrain_slope2_1)
			{
				if (x != slope_l.x) && (y >= slope_l.y + 1) v_spd = -(abs(h_spd));
			}
		}
		else if (slope_s1 != -4) && (slope_s1.image_xscale = -image_xscale)
		{
			slope_next = instance_position(slope_s1.x - (8 * slope_s1.image_xscale), y - 4, par_terrain);

			if (slope_next == -4)
			{
				if (x != slope_s1.x) && (y >= slope_s1.y + 1) v_spd = -(abs(h_spd)) / 2;
			}
		}
		else if (slope_s2 != -4) && (slope_s2.image_xscale = -image_xscale)
		{
			slope_next = instance_position(slope_s2.x - (8 * slope_s2.image_xscale), y - 8, par_terrain);

			if (slope_next == -4)
			{
				if (x != slope_s2.x) && (y >= slope_s2.y + 1) v_spd = -(abs(h_spd)) / 2;
			}
		}
	}
	
	var hit_smallwood = instance_place(x + sign(h_spd), y, obj_box_smallwood),
		hit_bigwood   = instance_place(x + sign(h_spd), y, obj_box_bigwood),
		hit_smallmetal = instance_place(x + sign(h_spd), y, obj_box_smallmetal);
	if (hit_smallwood != noone)
	{
		show_debug_message("Box hit")
		instance_destroy(hit_smallwood);
		shake_camera(2, 2);
	}
	else if (hit_bigwood != noone)
	{
		show_debug_message("Box hit")
		instance_destroy(hit_bigwood);
		shake_camera(3, 3);
	}
	else if (hit_smallmetal != noone)
	{
		show_debug_message("Box hit")
		instance_destroy(hit_smallmetal);
		shake_camera(4, 4);
	}
	else
	{
		if (hit_wall()) player_stun();
	}
}

down_thrown = false;
carry_to_kick = function()
{
	if(get_button("up"))
	{
		obj_player_bomb.v_spd = -(ground_spd * 2);
		if		(get_button("right")) obj_player_bomb.h_spd = ground_spd;
		else if (get_button("left"))  obj_player_bomb.h_spd = -ground_spd;
		else obj_player_bomb.h_spd = 1 * image_xscale;
		
		alarm[0] = game_get_speed(gamespeed_fps) / 3;
		player_set_state(state_throw);
		if(grounded()) v_spd = -jump_spd / 2;
	}
	else if(get_button("down") && !grounded())
	{
		obj_player_bomb.v_spd = ground_spd * 2;
		v_spd = -jump_spd;
		jumps = 1;
		down_thrown = true;
		sprite_index = spr_player_throw_down;
		player_set_state(state_jump)
	}
	else
	{
		obj_player_bomb.h_spd += (ground_spd * 2) * image_xscale;
		alarm[0] = game_get_speed(gamespeed_fps) / 3;
		player_set_state(state_kick);
		if(grounded()) v_spd = -jump_spd / 2;
	}
}

state_carry = function()
{
	state_name = "state_carry";
	
	if (h_spd != 0) sprite_index = spr_player_carrywalk;
	else sprite_index = spr_player_carry;
	
	depth = 1;
	obj_player_bomb.h_spd = 0;
	
	if(!grounded())
	{
		player_set_state(state_jump_carry);
		jumps = 0;
	}
	
	if (get_button_pressed("action2"))
	{
		carry_to_kick();
	}
}

state_jump_carry = function()
{
	state_name = "state_jump_carry";
	
	sprite_index = spr_player_carrywalk;
	image_speed = 0.075 * ground_spd;
	
	depth = 1;
	obj_player_bomb.h_spd = 0;
	
	if (get_button_pressed("action2"))
	{
		carry_to_kick();	
	}
}

state_ride = function()
{
	state_name = "state_ride";
	
	sprite_index = spr_player_ride;
	image_speed = h_spd / move_spd;
	move_spd = 8;
	fric = 0.075 * multi;
	
	obj_player_bomb.h_spd = h_spd;
	
	if (get_button_pressed("action2"))
	{
		player_set_state(state_ridekick);
		v_spd = -move_spd / 2;	
	}
}

state_ridekick = function()
{
	state_name = "state_ridekick";
	
	sprite_index = spr_player_ridekick;
	
	if (v_spd > 0) image_index = 1;
	else image_index = 0;
	
	if (y >= obj_player_bomb.y - (obj_player_bomb.sprite_height / 2))
	{
		player_set_state(state_kick);
		alarm[0] = game_get_speed(gamespeed_fps) / 3;
		obj_player_bomb.h_spd += (ground_spd * 4) * image_xscale
	}	
}

state_kick = function()
{
	state_name = "state_kick";

	sprite_index = spr_player_kick;	
}

state_throw = function()
{
	state_name = "state_throw";
	
	sprite_index = spr_player_throw;
	
	if (grounded()) player_set_state(state_free)
}

state_stunned = function()
{
	state_name = "state_stunned";
	
	image_xscale = -sign(h_spd);
	sprite_index = spr_player_jump;
	
	if (v_spd > 0) image_index = 1;
	else image_index = 0;
	
	if (grounded() || hit_wall())
	{
		dash = true;
		h_spd = 0;
		player_set_state(state_free);
	}
}

state_cutscene = function()
{
	
}

state = state_free;

#endregion