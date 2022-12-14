/// @description Init

#region Movement

h_spd     = 0;
v_spd     = 0;
dash      = true;
control   = true;
hp		  = 5;
cur_spr   = spr_player;
cur_img   = 0;
img_spd	  = 0;
anim_time = img_spd;
end_time  = game_get_speed(gamespeed_fps);
lvl_ended = false;
alpha	  = 1;

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

#endregion

#region States

state_name = "";

function grounded()
{
	return place_meeting(x, y + 1, par_terrain);	
}
function hit_wall()
{
	if (place_meeting(x + sign(h_spd), y, obj_terrain_flat) || place_meeting(x + sign(h_spd), y, obj_terrain_bump) || place_meeting(x + sign(h_spd), y, obj_terrain_half)) return true;
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
	play_sound("snd_bounce", 0.75, 1.1);
}
function reset_anim(_spd)
{
	img_spd = _spd;
	anim_time = img_spd;
}
function damage()
{
	play_sound("snd_punch", 0.8, 1.1);
	set_hp(-1);
	if (hp > 0) v_spd = -3;
	else obj_game.set_gameover();
}

state_free = function()
{
	state_name = "state_free";
	
	if (get_button("right") || get_button("left") || h_spd > ground_fric) cur_spr = spr_player_walk;
	else cur_spr = spr_player;
	move_spd = 4;
	fric = 0.4;
	
	if (get_button_pressed("action2"))
	{
		if (place_meeting(x, y, obj_player_bomb))
		{
			if (!obj_player_bomb.dmg_player) player_set_state(state_carry);
		}
		else
		{
			if (dash)
			{
				dash = false;
				alarm[0] = game_get_speed(gamespeed_fps) / 2;
				player_set_state(state_dash);
				play_sound("snd_dash", 0.85, 1);
			}
		}
	}
}

state_jump = function()
{
	state_name = "state_jump";
	
	if(!down_thrown)
	{
		if (jumps > 0) cur_spr = spr_player_jump;
		else cur_spr = spr_player_hover;
	}
	
	if (cur_spr == spr_player_jump)
	{
		if (v_spd > 0) cur_img = 1;
		else cur_img = 0;
	}
	else if(cur_spr == spr_player_throw_down && v_spd > 0) down_thrown = false;
	
	if (get_button_pressed("action2"))
	{
		if (place_meeting(x, y, obj_player_bomb)) player_set_state(state_jump_carry);
	}
}

state_dash = function()
{
	state_name = "state_dash";
	
	cur_spr = spr_player_dash;
	h_spd = 10 * image_xscale;
	
	if (place_meeting(x, y, obj_player_bomb)) if (!obj_player_bomb.dmg_player)
	{
		alarm[0] = -1;
		player_set_state(state_carry);
	}
	
	make_trail(cur_spr, cur_img, choose(c_red, c_blue, c_green));
	
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
	
	var hit_smallwood  = instance_place(x + h_spd, y, obj_box_smallwood),
		hit_smallmetal = instance_place(x + h_spd, y, obj_box_smallmetal),
		hit_bigwood	   = instance_place(x + h_spd, y, obj_box_bigwood),
		hit_cage	   = instance_place(x + h_spd, y, obj_wood_cage);
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
	cur_spr = spr_player_dash;
	move_spd = 15;
	h_spd = 15 * image_xscale;
	
	make_trail(cur_spr, cur_img, c_yellow, 0.75);
	
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

state_overdrive_carry = function()
{
	state_name = "state_overdrive_carry";
	
	shake_camera(1, 1);
	cur_spr = spr_player_carry;
	move_spd = 15;
	h_spd = move_spd * image_xscale;
	
	make_trail(cur_spr, cur_img, c_yellow, 0.75);
	
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
		cur_spr = spr_player_throw_down;
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
	
	if (h_spd != 0) cur_spr = spr_player_carrywalk;
	else cur_spr = spr_player_carry;
	
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
	
	cur_spr = spr_player_carrywalk;
	
	obj_player_bomb.h_spd = 0;
	
	if (get_button_pressed("action2"))
	{
		carry_to_kick();	
	}
}

state_ride = function()
{
	state_name = "state_ride";
	
	cur_spr = spr_player_ride;
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
	
	cur_spr = spr_player_ridekick;
	
	if (v_spd > 0) cur_img = 1;
	else cur_img = 0;
	
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

	cur_spr = spr_player_kick;	
}

state_throw = function()
{
	state_name = "state_throw";
	
	cur_spr = spr_player_throw;
	
	if (grounded()) player_set_state(state_free)
}

state_stunned = function()
{
	state_name = "state_stunned";
	
	if (h_spd != 0) image_xscale = -sign(h_spd);
	cur_spr = spr_player_jump;
	
	if (v_spd > 0) cur_img = 1;
	else cur_img = 0;
	
	var hit_smallwood  = instance_place(x + h_spd, y, obj_box_smallwood);
	if (hit_smallwood != noone)
	{
		show_debug_message("Box hit")
		instance_destroy(hit_smallwood);
		shake_camera(2, 2);
	}
	
	if (place_meeting(x + h_spd, y + v_spd, par_terrain))
	{
		dash = true;
		h_spd = 0;
		player_set_state(state_free);
	}
}

state_levelend = function()
{
	state_name = "state_levelend";
	
	cur_spr = spr_player_run;
	control = false;
	
	if (!lvl_ended) with (obj_game)
	{
		randomize();
		if (irandom(100) < 6)
		{
			var cam_x = camera_get_view_x(view_camera[0]),
				cam_y = camera_get_view_y(view_camera[0]),
				cam_w = camera_get_view_width(view_camera[0]),
				cam_h = camera_get_view_height(view_camera[0]),
				xx = irandom_range(cam_x, cam_x + cam_w),
				yy = irandom_range(cam_y, cam_y + cam_h);
				
			instance_create_layer(xx, yy, "Instances", obj_explosion);
		}
	}
	
	if (x >= room_width + (sprite_get_width(cur_spr) / 2))
	{
		h_spd = 0;
		if (end_time > 0) end_time--;
		else
		{
			if (!lvl_ended)
			{
				lvl_ended = true;
				instance_create_layer(0, 0, "Instances", obj_level_results);
			}
		}
	}
	else
	{
		if (grounded()) h_spd = 4;	
		else			h_spd = 0;
	}
}

state = state_free;

#endregion