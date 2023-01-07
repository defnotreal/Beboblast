v_spd = approach(v_spd, 10, 0.4);

move();

if (hit_wall_x() || hit_wall_y() || hit_bomb()) instance_destroy(id);
else if (hit_player())
{
	with (obj_player) damage();
	instance_destroy(id);
}