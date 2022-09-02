if (room == lvl_tutorial) with (obj_tutorial_tps)
{
	if (!respawning)
	{
		{
			respawning = true;
			fade(function() {
				obj_player.x = respawn_x;
				obj_player.y = respawn_y;
				respawning = false;
			});
		}	
	}
}