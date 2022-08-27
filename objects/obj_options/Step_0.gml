if (get_button_pressed("action1"))
{
	switch (sel)
	{
		case 0:
			menu_create(obj_controls, room_width / 4, (room_height / 2) - (room_height  / 3), fa_center, fa_middle, 16);
			instance_deactivate_object(self);
		break;
		case 1:
			menu_create(obj_audio_sliders, room_width / 4, (room_height / 2) - (room_height  / 6), fa_center, fa_middle, 32);
			instance_deactivate_object(self);
		break;
		case 2: go_tf_back(); break;
	}
}

if (get_button_pressed("action2")) go_tf_back();

// Inherit the parent event
event_inherited();