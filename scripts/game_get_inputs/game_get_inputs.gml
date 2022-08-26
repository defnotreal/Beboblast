function game_get_inputs()
{
	ini_open("data/settings.ini");
	var inputs = ["up", "down", "left", "right", "action1", "action2", "pause"];
	add_button("up", "down", "left", "right", "action1", "action2", "pause");

	for (var i = 0; i < array_length(inputs); i++;)
	{
		var read = ini_read_real("Controls", inputs[i], 0);
		
		if (read > 999) button_assign_gp(inputs[i], read);
		else button_assign_kb(inputs[i], read);
	}
	
	ini_close();
}