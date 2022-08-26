align(halign, valign);

for (var i = 0; i < array_length(menu); i++;)
{
	var yy  = y_pos + (y_off * i),
		str = menu[i];
		
	if (sel == i) str = ">" + str;
	draw_text(x_pos + (16 * (sel == i)), yy, str);
}

align_reset();