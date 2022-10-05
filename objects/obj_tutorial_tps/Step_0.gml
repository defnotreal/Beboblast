switch (room)
{
	case lvl_tutorial:
		if (obj_player.x > 3032) && (obj_player.y > room_height + obj_player.sprite_height)
		{
			if (!respawning)
			{
				respawning = true;
				fade(function() {
					player_hp = obj_player.hp;
					room_goto(lvl_tutorial2);
				});
			}
		}
	break;
	case lvl_tutorial2:
		obj_player.hp = player_hp;
		instance_destroy(self);
	break;
}