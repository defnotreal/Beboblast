/// @description Fullscreen

window_set_fullscreen(1 - window_get_fullscreen());

ini_open("data/settings.ini");
ini_write_real("Video", "fullscreen", window_get_fullscreen());
ini_close();