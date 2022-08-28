switch(state)
{
	case ctrlstate.select:
		if (get_button_pressed("action1"))
		{
			if (sel < 7) state = ctrlstate.binding;
			else if (sel == 8)
			{
				instance_activate_object(obj_options);
				instance_destroy(self);
			}
			else if(sel == 7)
			{
				sel = 0;
				state = ctrlstate.bindingall;
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
		if(bind_input(sel))
		{
			state = ctrlstate.select;
		}
		event_perform(ev_cleanup, 0);
		break;
		
	case ctrlstate.bindingall:
		get_valid_inputs();
		if(bind_input(sel))
		{
			sel++;
			if(sel > 6)
			{
				state = ctrlstate.select;
			}
		}
		event_perform(ev_cleanup, 0);
		break;
}

get_valid_inputs();


