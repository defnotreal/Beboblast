/// @description Init

h_spd = 0;
v_spd = 0;
grav  = 0.2;

image_speed = 0.25;

function grounded()
{
	return place_meeting(x, y + 1, par_terrain);
}

function create_trash(_amount)
{
	randomize();
	repeat(_amount)
	{
		var bb;
		if (image_xscale == -1) bb = bbox_right;
		else					bb = bbox_left;
		
		var t = instance_create_layer(bb, y - (sprite_height / 2), "Instances", obj_trashtalker_trash);
		t.h_spd = random(4) * -image_xscale;
		t.v_spd = random_range(-6, -1);
		t.rotate = random_range(-10, 10);
	}
}

#region States

state_free = function()
{
	sprite_index = spr_trashtalker_idle;
	
	var en = instance_place(median(obj_player.x, bbox_left - 24, bbox_right + 24), y, obj_player);
	
	if (en != -4)
	{
		state = state_jump;
		y--;
		if (en.x > x) image_xscale = -1;
		else image_xscale = 1;
		v_spd = -6;
	}
}

state_jump = function()
{
	if (v_spd == 0)
	{
		var bb;
		if (image_xscale == -1) bb = bbox_right;
		else					bb = bbox_left;
		
		state = state_spit;
		
		randomize();
		create_trash(irandom(2));
		
		var bag = instance_create_layer(bb, y - (sprite_height / 2), "Instances", obj_trashtalker_bag);
		bag.depth = depth - 1;
		bag.h_spd = 2 * -image_xscale;
	}
}

state_spit = function()
{
	sprite_index = spr_trashtalker_spit;
}

state_dead = function()
{
	sprite_index = spr_trashtalker_dead;
}

state = state_free;

#endregion