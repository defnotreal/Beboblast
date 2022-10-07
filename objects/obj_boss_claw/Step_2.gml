if (obj_grabbed == obj_player_bomb)
{
	obj_grabbed.x	  = x;
	obj_grabbed.y	  = y + sprite_get_height(spr_bomb);
	obj_grabbed.v_spd = 0;
}