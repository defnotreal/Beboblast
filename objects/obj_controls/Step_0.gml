if (!binding)
{
	if (get_button_pressed("action1"))
	{
		if (sel < 7) binding = true;
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
	exit;
}

get_valid_inputs();

if(control_type == ctrl.gp)
{
	for (var i = 0; i < ds_grid_width(valid_gp); i++;)
	{
		if (gp_check_pressed(valid_gp[# i, 0]))
		{
			switch (sel)
			{
				case 4:  var but = "action1";				   break;
				case 5:  var but = "action2";				   break;
				case 6:  var but = "pause";                    break;
				default: var but = string_lower(menu[sel, 0]); break;
			}
			
			ini_open("data/settings.ini");
			
			for (var j = 0; j < array_length(menu); j++;)
			{
				if (i == menu[j, 1])
				{
					switch (j)
					{
						case 4:  var but = "action1";				   break;
						case 5:  var but = "action2";				   break;
						case 6:  var but = "pause";                    break;
						default: var but = string_lower(menu[j, 0]); break;
					}
					
					ini_write_real("ControlsGP", but, -4);
				}
			}
		    ini_write_real("ControlsGP", but, valid_gp[# i, 0]);
			menu[sel, 1] = ini_read_real("ControlsGP", but, -4);
			ini_close();
			button_clear_gp(but);
			button_assign_gp(but, valid_gp[# i, 0]);
			bind_timer = 10;
			binding = false;
		}
	}
}

if(control_type == ctrl.kb)
{
	for (var i = 0; i < ds_grid_width(valid_key); i++;)
	{
		if keyboard_check_pressed(valid_key[# i, 0])
		{
			switch (sel)
			{
				case 4:  var but = "action1";				   break;
				case 5:  var but = "action2";				   break;
				case 6:  var but = "pause";                    break;
				default: var but = string_lower(menu[sel, 0]); break;
			}
		
			var k = keyboard_lastkey;
			show_debug_message(k);
			ini_open("data/settings.ini");
			
			for (var j = 0; j < array_length(menu); j++;)
			{
				if (k == menu[j, 1])
				{
					switch (j)
					{
						case 4:  var but = "action1";				   break;
						case 5:  var but = "action2";				   break;
						case 6:  var but = "pause";                    break;
						default: var but = string_lower(menu[j, 0]); break;
					}
					
					ini_write_real("Controls", but, -4);
				}
			}
			ini_write_real("Controls", but, k);
			menu[sel, 1] = ini_read_real("Controls", but, -4);
			ini_close();
			button_clear_kb(but);
			button_assign_kb(but, k);
			bind_timer = 10;
			binding = false;
		}
	}
}
event_perform(ev_cleanup, 0);