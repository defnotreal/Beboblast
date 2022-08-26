if (binding)
{
	for (var i = gp_face1; i < gp_axisrv; i++;)
	{
	    if (gamepad_button_check_pressed(0, i))
		{
			binding = false;
			switch (sel)
			{
				case 4:  var but = "action1";				   break;
				case 5:  var but = "action2";				   break;
				case 6:  var but = "pause";                    break;
				default: var but = string_lower(menu[sel, 0]); break;
			}
			
			show_debug_message(i);
			ini_open("data/settings.ini");
	        ini_write_real("Controls", but, i);
			menu[sel, 1] = ini_read_real("Controls", but, 0);
			ini_close();
			button_clear_kb(but);
			button_clear_gp(but);
			button_assign_gp(but, i, 0);
	    }
	}
	if keyboard_check_pressed(vk_anykey)
	{
		binding = false;
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
	    ini_write_real("Controls", but, k);
		menu[sel, 1] = ini_read_real("Controls", but, 0);
		ini_close();
		button_clear_gp(but);
		button_clear_kb(but);
		button_assign_kb(but, k, 0);
	}
	exit;
}

if (get_button_pressed("action1")) binding = true;

// Inherit the parent event
event_inherited();