function sprite_capture_screen()
{
	var s = sprite_create_from_surface(application_surface, 0,0,
									   window_get_width(), window_get_height(), false, false, 0, 0);
	return s;
}