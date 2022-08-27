if (!control) exit;

if (get_button_pressed("up"))
{
	if (sel == 0) sel = array_length(menu) - 1;
	else sel--;
	show_debug_message("Moved up");
}

if (get_button_pressed("down"))
{
	if (sel == array_length(menu) - 1) sel = 0;
	else sel++;
	show_debug_message("Moved down");
}