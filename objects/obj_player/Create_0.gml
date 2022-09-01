/// @description Init

#region Movement

h_spd   = 0;
v_spd   = 0;
dash    = true;

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

bomb	   = instance_create_depth(x, y, depth + 1, obj_player_bomb);
bomb.owner = id;
cam		   = instance_create_depth(x, y - (sprite_height / 2), 0, obj_camera);

particles  = part_system_create();
part_system_depth(particles, depth + 1);

part_trail = part_type_create();
part_type_sprite(part_trail, spr_player_dash, 1, 0, 0);
part_type_size(part_trail, 1, 1, 0, 0);
part_type_life(part_trail, 10, 10);
part_type_alpha3(part_trail, 0.5, 0.3, 0.1);

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
	return place_meeting(x + sign(h_spd), y, obj_terrain_flat);	
}
function bomb_hit_wall()
{
	with (bomb) return place_meeting(x + sign(h_spd), y, obj_terrain_flat);
}
function can_accel()
{
	if (h_spd < move_spd) && (h_spd > -move_spd) return true;
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
		if (place_meeting(x, y, bomb)) player_set_state(state_carry);
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
	
	if (get_button("action2")) && (ground_spd == 10)
	{
		sprite_index = spr_player_dash
		part_type_color1(part_trail, choose(c_red, c_blue, c_green));
		part_type_scale(part_trail, image_xscale, 1);
		part_particles_create(particles, x, y, part_trail, 1);
	}
	
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
	
	part_type_color1(part_trail, choose(c_red, c_blue, c_green));
	part_type_scale(part_trail, image_xscale, 1);
	part_particles_create(particles, x, y, part_trail, 1);
	
	if (place_meeting(x, y, bomb))
	{
		alarm[0] = -1;
		dash = true;
		player_set_state(state_carry);
	}
	
	var hit_smallwood  = instance_place(x + sign(h_spd), y, obj_box_smallwood),
		hit_smallmetal = instance_place(x + sign(h_spd), y, obj_box_smallmetal),
		hit_bigwood	   = instance_place(x + sign(h_spd), y, obj_box_bigwood);
	if (hit_smallwood != noone)
	{
		show_debug_message("Box hit")
		instance_destroy(hit_smallwood);
		shake_camera(2, 2);
	}
	else if (hit_smallmetal != noone)
	{
		show_debug_message("Box hit")
		player_stun();
	}
	else if (hit_bigwood != noone)
	{
		show_debug_message("Box hit")
		hit_bigwood.hp--;
		if (hit_bigwood.hp > 0) player_stun();
		else shake_camera(3, 3);
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
	
	part_type_color1(part_trail, c_yellow);
	part_type_scale(part_trail, image_xscale, 1);
	part_particles_create(particles, x, y, part_trail, 1);
	
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
		bomb.v_spd = -(ground_spd * 2);
		bomb.h_spd = h_spd * 2/3;
		alarm[0] = game_get_speed(gamespeed_fps) / 3;
		player_set_state(state_throw);
		if(grounded()) v_spd = -jump_spd / 2;
	}
	else if(get_button("down") && !grounded())
	{
		bomb.v_spd = ground_spd * 2;
		v_spd = -jump_spd;
		jumps = 1;
		down_thrown = true;
		sprite_index = spr_player_throw_down;
		player_set_state(state_jump)
	}
	else
	{
		bomb.h_spd += (ground_spd * 2) * image_xscale;
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
	bomb.h_spd = 0;
	
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
	bomb.h_spd = 0;
	
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
	
	bomb.h_spd = h_spd;
	
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
	
	if (y >= bomb.y - (bomb.sprite_height / 2))
	{
		player_set_state(state_kick);
		alarm[0] = game_get_speed(gamespeed_fps) / 3;
		bomb.h_spd += (ground_spd * 4) * image_xscale
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
	
	image_xscale = 1 * -sign(h_spd);
	sprite_index = spr_player_jump;
	
	if (v_spd > 0) image_index = 1;
	else image_index = 0;
	
	if (grounded())
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