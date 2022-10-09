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
		case 2: 
			if (timer_sec == 30) obj_player_bomb.spr = spr_bombmid;	
		break;
		case 1: if (timer_sec == 0) obj_player_bomb.spr = spr_bombblow; break;
	}
}

if (timer_min == 0) && (timer_sec < 10)
{
	timer_shake = (10 - timer_sec) / 2;
}

if (timer_fireanim > 0) timer_fireanim--;
else
{
	if (timer_fireimg == 3) timer_fireimg = 0;
	else timer_fireimg++;
	
	timer_fireanim = 5;
}

#endregion

#region Score stuff

score_shake		 = lerp(score_shake, 0, 0.2);
scoretoadd_shake = lerp(scoretoadd_shake, 0, 0.2);

if (score_timer > 0) score_timer--;
else
{
	if (score_timer == 0)
	{
		set_score();
		score_timer = -1;
	}
}

#endregion

#region HP stuff

if (obj_player.hp <= 1) hp_min_shake = 1;
else				    hp_min_shake = 0;

hp_shake = lerp(hp_shake, hp_min_shake, 0.2);

#endregion

if (get_button_pressed("pause")) && (can_pause)
{
	instance_deactivate_object(obj_player_bomb);
	instance_deactivate_object(obj_player);
	instance_deactivate_layer("Instances");
	menu_create(obj_pause, camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2), camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2), fa_center, fa_middle);
}