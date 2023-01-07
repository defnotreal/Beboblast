if (obj_player.state == obj_player.state_carry || obj_player.state == obj_player.state_jump_carry)
{
	obj_game.can_pause = false;
	obj_player.state   = obj_player.state_levelend;
	obj_player.y--;
	obj_player.v_spd   = -4;
	
	obj_player_bomb.spr = spr_bombblow;

}