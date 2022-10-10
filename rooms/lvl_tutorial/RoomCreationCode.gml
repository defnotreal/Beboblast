instance_create_layer(0, 0, "Instances", obj_tutorial_tps);
instance_create_depth(0, 0, -99, obj_game);

with (obj_game) timer_enabled = false;

play_music("mus_tutorial");