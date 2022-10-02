obj_player.cam.min_x  = 4080;
with (obj_game) time_enabled = false;

var w		   = instance_create_layer(4064, 0, "Collisions", obj_terrain_flat);
w.image_yscale = 15;

instance_destroy(obj_boss_trigger);