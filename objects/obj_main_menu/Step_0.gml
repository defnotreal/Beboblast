if (get_button_pressed("up"))
{
	if (sel == 0) sel = array_length(menu) - 1;
	else sel--;
}

if (get_button_pressed("down"))
{
	if (sel == array_length(menu) - 1) sel = 0;
	else sel++;
}