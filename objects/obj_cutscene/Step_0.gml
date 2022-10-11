#region Timers

if (anim_frames > 1)
{
	if (anim_time > 0) anim_time--;
	else
	{
		if (anim_img == anim_frames - 1)
		{
			if (anim_skiponend) 
			{
				cutscene_advance();
				exit;
			}
			else
			{
				if (anim_loop) anim_img = 0;
			}
		}
		else anim_img++;
		anim_time = anim_spd;
	}
}

if (!text_writing)
{
	if (anim_shake_dest_x > 0 || anim_shake_dest_y > 0)
	{
		if (anim_length == anim_shake_time)
		{
			anim_shake_x = anim_shake_dest_x;
			anim_shake_y = anim_shake_dest_y;
			play_sound(anim_shake_snd, 1, 1);
		}
	}
	
	if (anim_length > 0) anim_length--;
	else cutscene_advance();
}

#endregion

#region Typewriter text

var char	  = string_char_at(anim_text, text_pos + 1),
	char_next = string_char_at(anim_text, text_pos + 2);

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
	text_writing = false;
	text_delay	 = 1;
}

#endregion

if (get_button_pressed("action1"))
{
	if (text_writing)
	{
		text_out = anim_text;
		text_pos = string_length(anim_text);
		text_writing = false;
	}
	else cutscene_advance();
}

anim_shake_x = lerp(anim_shake_x, 0, 0.2);
anim_shake_y = lerp(anim_shake_y, 0, 0.2);