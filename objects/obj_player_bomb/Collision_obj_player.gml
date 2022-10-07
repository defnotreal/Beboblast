if (dmg_player)
{
	if (h_spd > 3 || h_spd < -3 || v_spd > 0.5 || v_spd < -0.5)
	{
		dmg_player = false;
		obj_player.damage();
	}
}