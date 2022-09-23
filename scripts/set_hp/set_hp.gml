function set_hp(num)
{
	hp += num;
	if (object_index == obj_player) with (obj_game) hp_shake = 6;
}