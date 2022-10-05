obj_player_bomb.x = x;

with (obj_player_bomb)
{
	y = 0;
	rotate = 0;
	v_spd = 10;
}

with (obj_game) lvl_boxeskilled++;

box_make_fragments();