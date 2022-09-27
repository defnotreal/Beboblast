
if (obj_player.state != obj_player.state_carry || obj_player.state != obj_player.state_ride)
{
	obj_player_bomb.h_spd = 0;
	obj_player_bomb.v_spd = 0;

	obj_hooked = obj_player_bomb;

	dest_x = owner.child.x;
	dest_y = owner.child.y + 8;
}