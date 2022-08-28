/// @description Init

event_inherited();

enum ctrl
{
	kb,
	gp
}
control_type = ctrl.kb;

menu[0, 0] = "Up";
menu[0, 1] =  -4;
menu[1, 0] = "Down";
menu[1, 1] = -4;
menu[2, 0] = "Left";
menu[2, 1] = -4;
menu[3, 0] = "Right";
menu[3, 1] = -4;
menu[4, 0] = "Action 1";
menu[4, 1] = -4;
menu[5, 0] = "Action 2";
menu[5, 1] = -4;
menu[6, 0] = "Start";
menu[6, 1] = -4;
menu[7, 0] = "Back";
menu[7, 1] = -4;

function set_control_type(type=ctrl.kb)
{
	control_type = type;
	
	ini_open("data/settings.ini");
	if(control_type == ctrl.kb)
	{
		menu[0, 1] = ini_read_real("Controls", "up", vk_up);
		menu[1, 1] = ini_read_real("Controls", "down", vk_down);
		menu[2, 1] = ini_read_real("Controls", "left", vk_left);
		menu[3, 1] = ini_read_real("Controls", "right", vk_right);
		menu[4, 1] = ini_read_real("Controls", "action1", ord("Z"));
		menu[5, 1] = ini_read_real("Controls", "action2", ord("X"));
		menu[6, 1] = ini_read_real("Controls", "pause", vk_enter);
	}
	else if(control_type == ctrl.gp)
	{
		menu[0, 1] = ini_read_real("ControlsGP", "up", gp.lu);
		menu[1, 1] = ini_read_real("ControlsGP", "down", gp.ld);
		menu[2, 1] = ini_read_real("ControlsGP", "left", gp.ll);
		menu[3, 1] = ini_read_real("ControlsGP", "right", gp.lr);
		menu[4, 1] = ini_read_real("ControlsGP", "action1", gp_face1);
		menu[5, 1] = ini_read_real("ControlsGP", "action2", gp_face2);
		menu[6, 1] = ini_read_real("ControlsGP", "pause", gp_start);
	}
	ini_close();
}

enum ctrlstate
{
	select,
	binding,
	bindingall
}
state   = ctrlstate.select;

function get_valid_inputs()
{
	valid_key = ds_grid_create(33, 2);
	valid_gp  = ds_grid_create(18, 2);
	
	ds_grid_add(valid_key, 0, 0, ord("A"));
	ds_grid_add(valid_key, 0, 1, "A");
	ds_grid_add(valid_key, 1, 0, ord("B"));
	ds_grid_add(valid_key, 1, 1, "B");
	ds_grid_add(valid_key, 2, 0, ord("C"));
	ds_grid_add(valid_key, 2, 1, "C");
	ds_grid_add(valid_key, 3, 0, ord("D"));
	ds_grid_add(valid_key, 3, 1, "D");
	ds_grid_add(valid_key, 4, 0, ord("E"));
	ds_grid_add(valid_key, 4, 1, "E");
	ds_grid_add(valid_key, 5, 0, ord("F"));
	ds_grid_add(valid_key, 5, 1, "F");
	ds_grid_add(valid_key, 6, 0, ord("G"));
	ds_grid_add(valid_key, 6, 1, "G");
	ds_grid_add(valid_key, 7, 0, ord("H"));
	ds_grid_add(valid_key, 7, 1, "H");
	ds_grid_add(valid_key, 8, 0, ord("I"));
	ds_grid_add(valid_key, 8, 1, "I");
	ds_grid_add(valid_key, 9, 0, ord("J"));
	ds_grid_add(valid_key, 9, 1, "J");
	ds_grid_add(valid_key, 10, 0, ord("K"));
	ds_grid_add(valid_key, 10, 1, "K");
	ds_grid_add(valid_key, 11, 0, ord("L"));
	ds_grid_add(valid_key, 11, 1, "L");
	ds_grid_add(valid_key, 12, 0, ord("M"));
	ds_grid_add(valid_key, 12, 1, "M");
	ds_grid_add(valid_key, 13, 0, ord("N"));
	ds_grid_add(valid_key, 13, 1, "N");
	ds_grid_add(valid_key, 14, 0, ord("O"));
	ds_grid_add(valid_key, 14, 1, "O");
	ds_grid_add(valid_key, 15, 0, ord("P"));
	ds_grid_add(valid_key, 15, 1, "P");
	ds_grid_add(valid_key, 16, 0, ord("Q"));
	ds_grid_add(valid_key, 16, 1, "Q");
	ds_grid_add(valid_key, 17, 0, ord("R"));
	ds_grid_add(valid_key, 17, 1, "R");
	ds_grid_add(valid_key, 18, 0, ord("S"));
	ds_grid_add(valid_key, 18, 1, "S");
	ds_grid_add(valid_key, 19, 0, ord("T"));
	ds_grid_add(valid_key, 19, 1, "T");
	ds_grid_add(valid_key, 20, 0, ord("U"));
	ds_grid_add(valid_key, 20, 1, "U");
	ds_grid_add(valid_key, 21, 0, ord("V"));
	ds_grid_add(valid_key, 21, 1, "V");
	ds_grid_add(valid_key, 22, 0, ord("W"));
	ds_grid_add(valid_key, 22, 1, "W");
	ds_grid_add(valid_key, 23, 0, ord("X"));
	ds_grid_add(valid_key, 23, 1, "X");
	ds_grid_add(valid_key, 24, 0, ord("Y"));
	ds_grid_add(valid_key, 24, 1, "Y");
	ds_grid_add(valid_key, 25, 0, ord("Z"));
	ds_grid_add(valid_key, 25, 1, "Z");
	ds_grid_add(valid_key, 26, 0, vk_up);
	ds_grid_add(valid_key, 26, 1, "Up");
	ds_grid_add(valid_key, 27, 0, vk_down);
	ds_grid_add(valid_key, 27, 1, "Down");
	ds_grid_add(valid_key, 28, 0, vk_left);
	ds_grid_add(valid_key, 28, 1, "Left");
	ds_grid_add(valid_key, 29, 0, vk_right);
	ds_grid_add(valid_key, 29, 1, "Right");
	ds_grid_add(valid_key, 30, 0, vk_space);
	ds_grid_add(valid_key, 30, 1, "Space");
	ds_grid_add(valid_key, 31, 0, vk_enter);
	ds_grid_add(valid_key, 31, 1, "Enter");
	ds_grid_add(valid_key, 32, 0, vk_escape);
	ds_grid_add(valid_key, 32, 1, "Escape");

	ds_grid_add(valid_gp, 0, 0, gp_padu);
	ds_grid_add(valid_gp, 0, 1, "D-Pad Up");
	ds_grid_add(valid_gp, 1, 0, gp_padd);
	ds_grid_add(valid_gp, 1, 1, "D-Pad Down");
	ds_grid_add(valid_gp, 2, 0, gp_padl);
	ds_grid_add(valid_gp, 2, 1, "D-Pad Left");
	ds_grid_add(valid_gp, 3, 0, gp_padr);
	ds_grid_add(valid_gp, 3, 1, "D-Pad Right");
	ds_grid_add(valid_gp, 4, 0, gp_face1);
	ds_grid_add(valid_gp, 4, 1, "Button A");
	ds_grid_add(valid_gp, 5, 0, gp_face2);
	ds_grid_add(valid_gp, 5, 1, "Button B");
	ds_grid_add(valid_gp, 6, 0, gp_face3);
	ds_grid_add(valid_gp, 6, 1, "Button X");
	ds_grid_add(valid_gp, 7, 0, gp_face4);
	ds_grid_add(valid_gp, 7, 1, "Button Y");
	ds_grid_add(valid_gp, 8, 0, gp_start);
	ds_grid_add(valid_gp, 8, 1, "Start");
	ds_grid_add(valid_gp, 9, 0, gp_select);
	ds_grid_add(valid_gp, 9, 1, "Select");
	ds_grid_add(valid_gp, 10, 0, gp_shoulderl);
	ds_grid_add(valid_gp, 10, 1, "Left Shoulder");
	ds_grid_add(valid_gp, 11, 0, gp_shoulderlb);
	ds_grid_add(valid_gp, 11, 1, "Left Trigger");
	ds_grid_add(valid_gp, 12, 0, gp_shoulderr);
	ds_grid_add(valid_gp, 12, 1, "Right Shoulder");
	ds_grid_add(valid_gp, 13, 0, gp_shoulderrb);
	ds_grid_add(valid_gp, 13, 1, "Right Trigger");
	ds_grid_add(valid_gp, 14, 0, gp.lu);
	ds_grid_add(valid_gp, 14, 1, "Left Stick Up");
	ds_grid_add(valid_gp, 15, 0, gp.ld);
	ds_grid_add(valid_gp, 15, 1, "Left Stick Down");
	ds_grid_add(valid_gp, 16, 0, gp.ll);
	ds_grid_add(valid_gp, 16, 1, "Left Stick Left");
	ds_grid_add(valid_gp, 17, 0, gp.lr);
	ds_grid_add(valid_gp, 17, 1, "Left Stick Right");
}

function get_key(key)
{
	var result = -4;
	get_valid_inputs();
	
	for (var i = 0; i < ds_grid_width(valid_key); i++;)
	{
		for (var j = 0; j < ds_grid_width(valid_gp); j++;)
		{
			if (key == valid_key[# i, 0])	  result = valid_key[# i, 1];
			else if (key == valid_gp[# j, 0]) result = valid_gp[# j, 1];
		}
	}
	event_perform(ev_cleanup, 0);
	return result;
}

function reset_keys()
{

	ini_open("data/settings.ini");
	
	if(control_type == ctrl.kb)
	{
		button_clear_kb("up");
		button_clear_kb("down");
		button_clear_kb("left");
		button_clear_kb("right");
		button_clear_kb("action1");
		button_clear_kb("action2");
		button_clear_kb("pause");
	
		button_assign_kb("up", vk_up);
		button_assign_kb("down", vk_down);
		button_assign_kb("left", vk_left);
		button_assign_kb("right", vk_right);
		button_assign_kb("action1", ord("Z"));
		button_assign_kb("action2", ord("X"));
		button_assign_kb("pause", vk_enter);
		
		ini_write_real("Controls", "up", vk_up);
		ini_write_real("Controls", "down", vk_down);
		ini_write_real("Controls", "left", vk_left);
		ini_write_real("Controls", "right", vk_right);
		ini_write_real("Controls", "action1", ord("Z"));
		ini_write_real("Controls", "action2", ord("X"));
		ini_write_real("Controls", "pause", vk_enter);
	
		menu[0, 1] = ini_read_real("Controls", "up", vk_up);
		menu[1, 1] = ini_read_real("Controls", "down", vk_down);
		menu[2, 1] = ini_read_real("Controls", "left", vk_left);
		menu[3, 1] = ini_read_real("Controls", "right", vk_right);
		menu[4, 1] = ini_read_real("Controls", "action1", ord("Z"));
		menu[5, 1] = ini_read_real("Controls", "action2", ord("X"));
		menu[6, 1] = ini_read_real("Controls", "pause", vk_enter);
	}
	else if(control_type == ctrl.gp)
	{
		button_clear_gp("up");
		button_clear_gp("down");
		button_clear_gp("left");
		button_clear_gp("right");
		button_clear_gp("action1");
		button_clear_gp("action2");
		button_clear_gp("pause");
		
		button_assign_gp("up", gp.lu);
		button_assign_gp("down", gp.ld);
		button_assign_gp("left", gp.ll);
		button_assign_gp("right", gp.lr);
		button_assign_gp("action1", gp_face1);
		button_assign_gp("action2", gp_face2);
		button_assign_gp("pause", gp_start);
		
		ini_write_real("ControlsGP", "up", gp.lu);
		ini_write_real("ControlsGP", "down", gp.ld);
		ini_write_real("ControlsGP", "left", gp.ll);
		ini_write_real("ControlsGP", "right", gp.lr);
		ini_write_real("ControlsGP", "action1", gp_face1);
		ini_write_real("ControlsGP", "action2", gp_face2);
		ini_write_real("ControlsGP", "pause", gp_start);
		
		menu[0, 1] = ini_read_real("ControlsGP", "up", gp.lu);
		menu[1, 1] = ini_read_real("ControlsGP", "down", gp.ld);
		menu[2, 1] = ini_read_real("ControlsGP", "left", gp.ll);
		menu[3, 1] = ini_read_real("ControlsGP", "right", gp.lr);
		menu[4, 1] = ini_read_real("ControlsGP", "action1", gp_face1);
		menu[5, 1] = ini_read_real("ControlsGP", "action2", gp_face2);
		menu[6, 1] = ini_read_real("ControlsGP", "pause", gp_start);
	}
	
	ini_close();
}

function bind_input(index)
{
	if(control_type == ctrl.gp)
	{
		for (var i = 0; i < ds_grid_width(valid_gp); i++;)
		{
			if (gp_check_pressed(valid_gp[# i, 0]))
			{
				switch (index)
				{
					case 4:  var but = "action1";				   break;
					case 5:  var but = "action2";				   break;
					case 6:  var but = "pause";                    break;
					default: var but = string_lower(menu[index, 0]); break;
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
				menu[index, 1] = ini_read_real("ControlsGP", but, -4);
				ini_close();
				button_clear_gp(but);
				button_assign_gp(but, valid_gp[# i, 0]);
				bind_timer = 10;
				state = ctrlstate.select;
			}
		}
	}

	if(control_type == ctrl.kb)
	{
		for (var i = 0; i < ds_grid_width(valid_key); i++;)
		{
			if keyboard_check_pressed(valid_key[# i, 0])
			{
				switch (index)
				{
					case 4:  var but = "action1";				   break;
					case 5:  var but = "action2";				   break;
					case 6:  var but = "pause";                    break;
					default: var but = string_lower(menu[index, 0]); break;
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
				menu[index, 1] = ini_read_real("Controls", but, -4);
				ini_close();
				button_clear_kb(but);
				button_assign_kb(but, k);
				bind_timer = 10;
				state = ctrlstate.select;
			}
		}
	}
}