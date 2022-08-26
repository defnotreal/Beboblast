/// @description Init

add_button("left", "right");

button_assign_kb("left", vk_left, ord("A"));
button_assign_kb("right", vk_right, ord("D"));

button_assign_gp("left", gp.ll, gp_padl);
button_assign_gp("right", gp.lr, gp_padr);

event_inherited();

menu[0] = "Music";
menu[1] = "SFX";
menu[2] = "Back";

go_tf_back = function()
{
	ini_open("data/settings.ini");
	ini_write_real("Audio", "Music", audio_emitter_get_gain(global.a_music));
	ini_write_real("Audio", "Sound", audio_emitter_get_gain(global.a_sound));
	ini_close();
	
	instance_activate_object(obj_options);
	instance_destroy(self);
}