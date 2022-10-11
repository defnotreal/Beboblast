/// @description Init

event_inherited();

menu[0] = "Music";
menu[1] = "SFX";
menu[2] = "Back";

ind = audio_create_stream("sound/snd_bounce.ogg");

go_tf_back = function()
{
	ini_open("data/settings.ini");
	ini_write_real("Audio", "music", audio_emitter_get_gain(global.a_music));
	ini_write_real("Audio", "sound", audio_emitter_get_gain(global.a_sound));
	ini_close();
	
	instance_activate_object(obj_options);
	instance_destroy(self);
}