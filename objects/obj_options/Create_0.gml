/// @description Init

event_inherited();

menu[0] = "Keyboard";
menu[1] = "Gamepad";
menu[2] = "Audio";
menu[3] = "Back";

go_tf_back = function()
{
	obj_menu_anims.title_alpha = 1;
	instance_activate_object(obj_main_menu);
	instance_destroy(self);
}