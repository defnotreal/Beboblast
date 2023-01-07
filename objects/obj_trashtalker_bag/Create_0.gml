/// @description Init

h_spd = 0;
v_spd = 0;

function hit_wall_x()
{
	return place_meeting(x + sign(h_spd), y, par_terrain);
}

function hit_wall_y()
{
	return place_meeting(x, y + 1, par_terrain);
}

function hit_player()
{
	return place_meeting(x, y, obj_player);
}

function hit_bomb()
{
	return place_meeting(x, y, obj_player_bomb);
}

function create_trash(_amount)
{
	randomize();
	repeat(_amount)
	{
		var t = instance_create_layer(bbox_right, y - (sprite_height / 2), "Instances", obj_trashtalker_trash);
		t.h_spd = random_range(-4, 4);
		t.v_spd = random_range(-6, -1);
		t.rotate = random_range(-10, 10);
	}
}