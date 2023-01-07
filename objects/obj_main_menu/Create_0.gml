/// @description Init

event_inherited();

ini_open("data/settings.ini");
audio_emitter_gain(global.a_music, ini_read_real("Audio", "music", 1));
ini_close();

play_music("mus_title");

menu[0] = "Start";
menu[1] = "Options";
menu[2] = "Quit";