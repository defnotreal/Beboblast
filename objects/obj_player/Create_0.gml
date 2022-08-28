/// @description Init

#region Movement

h_spd = 0;
v_spd = 0;
dash  = true;

multi = 1;

ground_spd		 = 4	* multi;
air_spd			 = 4	* multi;
jump_spd		 = 4	* multi;
dash_spd		 = 8	* multi;
ground_fric      = 0.5  * multi;
air_fric         = 0.35 * multi;
grav			 = 0.2  * multi;
grav_max		 = 10   * multi;

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

grounded = function()
{
	return place_meeting(x, y + 1, par_terrain);	
}
hit_wall = function()
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

state_free = function()
{
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
				player_set_state(state_dash);
				alarm[0] = game_get_speed(gamespeed_fps) / 3;
			}
		}
	}
	
	state_name = "state_free";
}

state_jump = function()
{
	if (jumps > 0) sprite_index = spr_player_jump;
	else sprite_index = spr_player_hover;
	
	if (sprite_index == spr_player_jump)
	{
		if (v_spd > 0) image_index = 1;
		else image_index = 0;
	}
	
	state_name = "state_jump";
}

state_dash = function()
{
	sprite_index = spr_player_dash;
	move_spd = 10;
	h_spd = move_spd * image_xscale;
	image_speed = 0.075 * abs(h_spd);
	
	part_type_color1(part_trail, choose(c_red, c_blue, c_green));
	part_type_scale(part_trail, image_xscale, 1);
	part_particles_create(particles, x, y, part_trail, 1);
	
	if (get_button_pressed("action1"))
	{
		alarm[0] = -1;
		alarm[1] = game_get_speed(gamespeed_fps) / 2;	
	}
	
	if (place_meeting(x, y, bomb))
	{
		alarm[0] = -1;
		alarm[1] = game_get_speed(gamespeed_fps) / 2;
		player_set_state(state_carry);
	}
	
	state_name = "state_dash";
}

state_carry = function()
{
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
		player_set_state(state_kick);
		alarm[0] = game_get_speed(gamespeed_fps) / 3;
		bomb.h_spd += (ground_spd * 4) * image_xscale		
	}
	
	state_name = "state_carry";
}

state_jump_carry = function()
{
	//if (h_spd != 0) sprite_index = spr_player_carrywalk;
	//else sprite_index = spr_player_carry;
	sprite_index = spr_player_carrywalk;
	image_speed = 0.075 * ground_spd;
	
	depth = 1;
	bomb.h_spd = 0;
	
	if (get_button_pressed("action2"))
	{
		player_set_state(state_kick);
		alarm[0] = game_get_speed(gamespeed_fps) / 3;
		bomb.h_spd += (ground_spd * 4) * image_xscale		
	}
	
	state_name = "state_jump_carry";
}

state_ride = function()
{
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
	
	state_name = "state_ride";
}

state_ridekick = function()
{
	sprite_index = spr_player_ridekick;
	
	if (v_spd > 0) image_index = 1;
	else image_index = 0;
	
	if (y >= bomb.y - (bomb.sprite_height / 2))
	{
		state = state_kick;
		alarm[0] = game_get_speed(gamespeed_fps) / 3;
		bomb.h_spd += (ground_spd * 4) * image_xscale
	}	
	
	state_name = "state_ridekick";
}

state_kick = function()
{
	sprite_index = spr_player_kick;	
	
	state_name = "state_kick";
}

state_stunned = function()
{
	
}

state = state_free;

#endregion