layer_x("Clouds", layer_get_x("Clouds") + 0.1);
layer_x("BuildingsBack", layer_get_x("BuildingsBack") + 0.5);
layer_x("BuildingsFront", layer_get_x("BuildingsFront") + 1);
layer_x("Ground", layer_get_x("Ground") + 1.5);

if (!instance_exists(obj_trans_fade)) && (part == 0)
{
	if (fade_alpha > 0) fade_alpha -= 0.01;
	else part++
}

if (part == 2)
{
	var char	  = string_char_at(credit_text[credit_sel], text_pos + 1),
	char_next = string_char_at(credit_text[credit_sel], text_pos + 2);

	if (char != "")
	{
		if (text_delay > 0) text_delay--;
		else
		{
			text_out += char;
		
			switch (char)
			{
				case ",": text_delay = 8; break;
				case ".": text_delay = 16; break;
				case "?":
					if (char_next == " ") text_delay = 16;
					else text_delay = 1;
				break;
				case "!":
					if (char_next == " ") text_delay = 16;
					else text_delay = 1;
				break;
				default: text_delay = 1;
			}
			text_pos++;
		}
	}
	else
	{
		if (text_writing) text_writing = false;	
	}
}

if (!text_writing)
{
	if (credit_move > 0) credit_move--;
	else
	{
		if (part == 3) fade(function() {
							audio_stop_sound(global.cur_mus);
							room_goto(main_menu);
						});
		else advance_credits();
	}
}
	
if (get_button_pressed("action1")) && (part == 2) && (credit_sel < array_length(credit_text) - 1)
{
	if (text_writing)
	{
		text_out = credit_text[credit_sel];
		text_pos = string_length(credit_text[credit_sel]);
		text_writing = false;
	}
	else advance_credits();
}