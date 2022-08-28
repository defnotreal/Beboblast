switch(state)
{
	case ctrlstate.select:
		if (get_button_pressed("action1"))
		{
			if (sel < 7) state = ctrlstate.binding;
			else
			{
				instance_activate_object(obj_options);
				instance_destroy(self);
			}
		}

		if (get_button_pressed("action2"))
		{
			instance_activate_object(obj_options);
			instance_destroy(self);
		}

		if (get_button("left"))
		{
			if (get_button_pressed("pause")) reset_keys();	
		}

		// Inherit the parent event
		event_inherited();
		break;
	
	case ctrlstate.binding:
		get_valid_inputs();
		bind_input(sel);
		event_perform(ev_cleanup, 0);
		break;
}

get_valid_inputs();


