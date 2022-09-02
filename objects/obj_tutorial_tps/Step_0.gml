if (obj_player.x = clamp(obj_player.x, jump_sign_x - 10, jump_sign_x + 10))
{
	respawn_x = jump_sign_x;
	respawn_y = jump_sign_y;
}
else if (obj_player.x = clamp(obj_player.x, charge_sign_x - 10, charge_sign_x + 10))
{
	respawn_x = charge_sign_x;
	respawn_y = jump_sign_y;			
}

if (obj_player.x > 3032) && (obj_player.y > room_height + obj_player.sprite_height)
{
	if (!respawning)
	{
		respawning = true;
		fade(function() { room_goto(lvl_tutorial2); });
	}
}