if (get_button_pressed("action1"))
{
	switch (sel)
	{
		case 1:
			obj_menu_anims.title_alpha = 0;
			menu_create(obj_options, room_width / 4, (room_height / 2) - (room_height  / 6), fa_center, fa_middle);
			instance_deactivate_object(self);
		break;
		case 2:
			control = false;
			obj_menu_anims.part = -4;
		break;
	}
}

// Inherit the parent event
event_inherited();