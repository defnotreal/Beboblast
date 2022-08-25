align(fa_left, fa_middle);

for (var i = 0; i < array_length(menu); i++;)
{
	var yy  = (room_height / 2) + (32 * i),
		str = menu[i];
		
	if (sel == i) str = str + "<";
	draw_text(room_height / 8, yy, str);
}

align_reset();