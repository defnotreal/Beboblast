var play = instance_create_depth(room_width / 2, 384, 0, obj_player),
	bomb = instance_create_depth(room_width / 2, 384, 1, obj_player_bomb);
bomb.owner = play.id;