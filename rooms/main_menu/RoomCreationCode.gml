ini_open("data/settings.ini");

var butts = ["up", "down", "left", "right", "action1", "action2", "pause"];

for (var i = 0; i < array_length(butts); i++;)
{
	add_button(butts[i]);
	
	var in = ini_read_real("Controls", butts[i], -4);
	
	button_assign_kb(butts[i], in);
	
	in = ini_read_real("ControlsGP", butts[i], -4);
	
	button_assign_gp(butts[i], in);
}

ini_close();

cam = instance_create_depth(0, 0, 0, obj_camera);

instance_create_depth(0, 0, 0, obj_persistent);
instance_create_depth(0, 0, 0, obj_menu_anims);