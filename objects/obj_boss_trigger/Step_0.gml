if (do_countdown)
{
	if (spawn_time > 0) spawn_time--;
	else instance_destroy(self);
}