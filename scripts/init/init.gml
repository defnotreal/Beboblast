#macro DEBUG     true
#macro TILE_SIZE 16

//'if (!file_exists("data/settings.ini"))
{
	ini_open("data/settings.ini");
	ini_write_real("Audio", "music", 1);
	ini_write_real("Audio", "sound", 1);
	ini_write_real("Video", "fullscreen", 0);
	ini_write_real("Controls", "up", gp.lu);
	ini_write_real("Controls", "down", gp.ld);
	ini_write_real("Controls", "left", gp.ll);
	ini_write_real("Controls", "right", gp.lr);
	ini_write_real("Controls", "action1", gp_face1);
	ini_write_real("Controls", "action2", gp_face2);
	ini_write_real("Controls", "pause", gp_start);
	ini_close();
}

global.cam = camera_create();
camera_set_view_size(global.cam, 320, 180);

global.a_music = audio_emitter_create();
global.a_sound = audio_emitter_create();

var cap = "BEBO BLOWS IT!";
if (DEBUG) cap = cap + " (DEBUG)";
window_set_caption(cap);

ini_open("data/settings.ini");
audio_emitter_gain(global.a_music, ini_read_real("Audio", "music", 1));
audio_emitter_gain(global.a_sound, ini_read_real("Audio", "sound", 1));
window_set_fullscreen(ini_read_real("Video", "fullscreen", 0));
ini_close();