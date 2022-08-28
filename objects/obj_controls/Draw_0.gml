align(halign, valign);

for (var i = 0; i < array_length(menu); i++;)
{
	var yy  = y_pos + (y_off * i),
		str;
	
	if (i < 7)
	{
		if (state == ctrlstate.binding) && (sel == i) str = menu[i, 0] + ": ...";
		else if (menu[i, 1] == -4) str = menu[i, 0] + ": None";
		else str = menu[i, 0] + ": " + get_key(menu[i, 1]);
	}
	else str = menu[i, 0];
		
	if (sel == i) str = ">" + str;
	draw_text_transformed(x_pos + (16 * (sel == i)), yy, str, 0.5, 0.5, 0);
}

align(fa_left, fa_bottom)
draw_text(10, room_height - 10, string(state));

align_reset();