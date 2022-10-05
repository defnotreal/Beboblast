align(halign, valign);

for (var i = 0; i < array_length(menu); i++;)
{
	var yy  = y_pos + (y_off * i),
		str = menu[i];
		
	if (sel == i) str = ">" + str;
	draw_text_outlined(x_pos + (16 * (sel == i)), yy, str, 1, 1, c_white, c_black, 1);
}

align_reset();