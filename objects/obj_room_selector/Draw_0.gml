align(halign, valign);

for (var i = 0; i < array_length(menu); i++;)
{
	var yy  = y_pos + (y_off * i),
		str = menu[i];
		
	if (sel == i) str = ">" + str;
	draw_text_transformed(x_pos + (16 * (sel == i)), yy, str, 0.5, 0.5, 0);
}

draw_sprite_ext(whatthefuckwhyisbebebosmokingweed, 0,
				room_width - (sprite_get_width(whatthefuckwhyisbebebosmokingweed) / 14),
				room_height - (sprite_get_height(whatthefuckwhyisbebebosmokingweed) / 14),
				weed_scale * 0.1, 0.1, 0, c_white, 1);

align_reset();