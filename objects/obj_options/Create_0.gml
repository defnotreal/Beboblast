/// @description Init

event_inherited();

menu[0] = "Controls";
menu[1] = "Audio";
menu[2] = "Back";

go_tf_back = function()
{
	obj_menu_anims.title_alpha = 1;
	instance_activate_object(obj_main_menu);
	instance_destroy(self);
}