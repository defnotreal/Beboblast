if (room == lvl_tutorial || room == lvl_tutorial2)
{
	with (obj_tutorial_tps)
	{
		if (!respawning)
		{
			{
				respawning = true;
				fade(function() {
					obj_player.v_spd = 0;
					obj_player.x	 = respawn_x;
					obj_player.y	 = respawn_y;
					respawning		 = false;
				});
			}	
		}
	}
}