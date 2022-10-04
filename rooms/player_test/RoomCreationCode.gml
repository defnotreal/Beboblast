var play = instance_create_layer(room_width / 2, 384, "Instances", obj_player),
	bomb = instance_create_layer(room_width / 2, 384, "Instances", obj_player_bomb);
bomb.owner = play.id;

instance_create_depth(0, 0, 0, obj_game);