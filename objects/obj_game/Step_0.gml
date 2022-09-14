#region Timer stuff

if (timer_enabled)
{
	if (timer_tick > 0) timer_tick--;
	else
	{
		timer_tick = game_get_speed(gamespeed_fps);
		
		if (timer_sec == 0)
		{
			if (timer_min > 0) timer_min--;
			else
			{
				timer_enabled = false;	
			}
		}
		
		if (timer_min > -1)
		{
			if (timer_sec > 0) timer_sec--;
			else timer_sec = 59;
		}
	}
	
	switch (timer_min)
	{
		case 8: timer_img = 1; break;
		case 6: timer_img = 2; break;
		case 4: timer_img = 3; break;
		case 2: timer_img = 4; break;
		case 1: timer_img = 5; break;
		case 0:
			switch (timer_sec)
			{
				case 50: timer_img = 6;  break;
				case 40: timer_img = 7;  break;
				case 30: timer_img = 8;  break;
				case 20: timer_img = 9;  break;
				case 10: timer_img = 10; break;
			}
		break;
	}
}

switch (timer_img)
{
	case 1: timer_firex = 278; break;
	case 2: timer_firex = 246; break;
	case 3: timer_firex = 214; break;
	case 4: timer_firex = 182; break;
	case 5: timer_firex = 150; break;
	case 6: timer_firex = 134; break;
	case 7: timer_firex = 118; break;
	case 8: timer_firex = 102; break;
	case 9:
		timer_firex = 70;
		timer_firey = 146;
	break;
	case 10:
		timer_firex = 45;
		timer_firey = 135;
	break;
}

if (timer_min == 0) && (timer_sec < 10)
{
	timer_shake = (10 - timer_sec) / 2;
}

#endregion