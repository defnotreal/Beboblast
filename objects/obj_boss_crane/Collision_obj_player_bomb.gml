if (obj_player_bomb.h_spd > 3) && (state != state_hurt || state != state_dead)
{
	hp--;
	if (hp > 0) state = state_hurt;
	else		state = state_dead;
	
	img = 0;
}