#macro TILE_SIZE 16
#macro MAIN_FONT font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.!?:(),<>-_+`'/", true, 1)

if (!file_exists("data/settings.ini"))
{
	ini_open("data/settings.ini");
	
	ini_write_real("Audio", "music", 1);
	ini_write_real("Audio", "sound", 1);
	ini_write_real("Video", "fullscreen", 0);
	
	ini_write_real("Controls", "up", vk_up);
	ini_write_real("Controls", "down", vk_down);
	ini_write_real("Controls", "left", vk_left);
	ini_write_real("Controls", "right", vk_right);
	ini_write_real("Controls", "action1", ord("Z"));
	ini_write_real("Controls", "action2", ord("X"));
	ini_write_real("Controls", "pause", vk_enter);
	
	ini_write_real("ControlsGP", "up", gp.lu);
	ini_write_real("ControlsGP", "down", gp.ld);
	ini_write_real("ControlsGP", "left", gp.ll);
	ini_write_real("ControlsGP", "right", gp.lr);
	ini_write_real("ControlsGP", "action1", gp_face1);
	ini_write_real("ControlsGP", "action2", gp_face2);
	ini_write_real("ControlsGP", "pause", gp_start);
	
	ini_write_real("Misc", "debug", 0);
	
	ini_close();
}

global.cam = camera_create();
camera_set_view_size(global.cam, 320, 180);

global.a_music = audio_emitter_create();
global.a_sound = audio_emitter_create();

ini_open("data/settings.ini");
global.debug = ini_read_real("Misc", "debug", 0);
window_set_fullscreen(ini_read_real("Video", "fullscreen", 0));
ini_close();

var cap = "BEBOBLAST";
if (global.debug) cap = cap + " (DEBUG)";
window_set_caption(cap);

draw_set_font(MAIN_FONT);