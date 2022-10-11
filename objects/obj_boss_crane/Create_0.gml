/// @description Init

hp	       = 8;
thrown     = false;
img		   = 0;
h_spd	   = 0;
v_spd	   = 0;
do_anim    = true;
anim_time  = 5;
state_name = "";
hurt_time  = game_get_speed(gamespeed_fps);
claw_time  = game_get_speed(gamespeed_fps) * 10;
alpha	   = 1;
do_results = true;
do_grav	   = false;

image_speed = 0;

#region States

function damage()
{
	hp--;
	play_sound("snd_punch", 0.5, 1.5);
	if (hp > 0) state = state_hurt;
	else 
	{
		state = state_dead;
		
		if (instance_exists(obj_boss_claw)) with (obj_boss_claw)
		{
			part = 9;
			dest_y = -sprite_height;
			dest_angle = 0;
		}
		
		play_sound("snd_explode", 0.8, 1.1)
		h_spd = 1;
		do_grav = true;
		v_spd = -4;
	}
	
	img = 0;
}

state_intro = function()
{
	sprite_index = spr_boss_craneempty;	
	
	state_name = "state_intro";
}

state_free  = function()
{
	sprite_index = spr_boss_craneidle;
	
	do_anim   = true;
	anim_time = 5;
	
	if (obj_player_bomb.x >= x - 110) && (obj_player_bomb.y <= y - 32) && (!thrown)	   state = state_throw;
	else if (obj_player.x >= x - 110) && (obj_player.y <= y - 32) && (!thrown)		   state = state_throw;
	
	var w = instance_find(obj_wrench, 0);
	
	if (w != -4) && (w.x >= x - 36)
	{
		instance_destroy(w);
		state	  = state_catch;
		img		  = 0;
	}
	
	state_name = "state_free";
}

state_throw = function()
{
	sprite_index = spr_boss_cranewrenchthrow;
	
	if (img == 9) && (!thrown)
	{
		thrown = true;
		instance_create_layer(x - 40, y - 55, "Instances", obj_wrench);
	}
	
	if (img == sprite_get_number(sprite_index) - 1) state = state_free;
	
	var w = instance_find(obj_wrench, 0);
	
	if (w != -4) && (w.x >= x - 36)
	{
		instance_destroy(w);
		state	  = state_catch;
		img		  = 0;
	}
	
	state_name = "state_throw";
}

state_catch = function()
{
	sprite_index = spr_boss_cranewrenchcatch;
	
	if (img == sprite_get_number(sprite_index) - 1)
	{
		state = state_free;
		thrown = false;
		img = 0;
	}
	
	state_name = "state_catch";
}

state_hurt = function()
{
	sprite_index = spr_boss_cranehurt;
	
	if (img == sprite_get_number(sprite_index) - 1)
	{
		state = state_free;
		img = 0;
	}
	
	state_name = "state_hurt";
}

state_dead = function()
{
	sprite_index = spr_boss_cranedead;
	state_name = "state_dead";
	
	if (y >= room_height + sprite_height)
	{
		if (do_results)
		{
			do_results		   = false;
			obj_player.control = false;
			instance_create_layer(0, 0, "Instances", obj_level_results);
			instance_deactivate_object(obj_player_bomb);
			instance_deactivate_object(obj_player);
			instance_destroy(self);
		}	
	}
}

#endregion

state = state_intro;