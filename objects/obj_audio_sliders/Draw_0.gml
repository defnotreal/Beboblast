align(halign, valign);

for (var i = 0; i < array_length(menu); i++;)
{
	var yy = y_pos + (y_off * i),
		str = menu[i];
		
	if (i < 2)
	{
		if (sel == i) str = "< " + str + " >"
		draw_text_outlined(x_pos, yy, str, 1, 1, c_white, c_black, 1);
		draw_rectangle_color(x_pos - 64, yy + 10, x_pos + 64, yy + 20, c_black, c_black, c_black, c_black, true)
		switch (i)
		{
			case 0: var vol = audio_emitter_get_gain(global.a_music); break;
			case 1: var vol = audio_emitter_get_gain(global.a_sound); break;
		}
		if (vol > 0) draw_rectangle(x_pos - 64, yy + 10, (x_pos - 64) + ((64 * 2) * vol), yy + 20, false);
		align(fa_left, fa_middle);
		draw_text_outlined(x_pos + 72, yy + 15, string(floor(vol * 100)), 1, 1, c_white, c_black, 1);
		align(halign, valign);
	}
	else
	{
		if (sel == i) str = ">" + str;
		draw_text_outlined(x_pos + (16 * (sel == i)), yy, str, 1, 1, c_white, c_black, 1);
	}
}

align_reset();