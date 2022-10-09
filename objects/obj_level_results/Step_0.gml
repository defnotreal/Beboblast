if (anim_bg)
{
	var lx = layer_get_x("ResultsBG"),
		ly = layer_get_y("ResultsBG");

	layer_x("ResultsBG", lx - 0.5);
	layer_y("ResultsBG", ly - 0.5);

	if (lx == -36.5) && (ly == -38.5)
	{
		layer_x("ResultsBG", 0);
		layer_y("ResultsBG", 0);
	}
}

switch (part)
{
	case 0:
		bebo_dunk_scale = lerp(bebo_dunk_scale, 0.5, 0.1);
		
		if (bebo_dunk_scale >= 0.499)
		{
			part++;
			bebo_dunk_scale = 0.5;
		}
	break;
	case 1:
		if (bebo_dunk_time > 0) bebo_dunk_time--;
		else
		{
			bebo_dunk_img++;
			if (bebo_dunk_img < sprite_get_number(spr_bebo_dunk) - 1) bebo_dunk_time = 2;
			else part++;
		}
	break;
	case 2:
		if (bebo_dunk_v_spd < 10) bebo_dunk_v_spd += 0.4;
		bebo_dunk_y += bebo_dunk_v_spd;
		if (bebo_dunk_y >= (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + sprite_get_height(spr_bebo_dunk)))
		{
			part++;
			welldone_v_spd = -2;
		}
	break;
	case 3:
		if (welldone_v_spd < 10) welldone_v_spd += 0.4;
		welldone_y += welldone_v_spd;
		
		if (welldone_y > welldone_anchor_y)
		{
			welldone_y = welldone_anchor_y - 1;
			welldone_v_spd = -welldone_v_spd + 3;
			
			if (welldone_v_spd > 0)
			{
				part++;
				welldone_v_spd = 0;
				welldone_y = welldone_anchor_y;
				boxes_alpha = 1;
			}
		}
	break;
	case 4:
		if (boxes_total < obj_game.lvl_boxeskilled)
		{
			boxes_total++;
			boxes_shake = 2;
		}
		else
		{
			if (wait_time > 0) wait_time--;
			else
			{
				part++;
				if (boxes_total == obj_game.lvl_totalboxes)
				{
					bonus_alpha = 1;
					bonus_shake = 2;
					score_final += 1000;
				}
				wait_time = game_get_speed(gamespeed_fps) / 2;
				time_alpha = 1;
			}
		}
	break;
	case 5:
		if (time_total < time_final)
		{
			time_total++;
			time_shake = 2;
		}
		else
		{
			
			if (wait_time > 0) wait_time--;
			else
			{
				part++;
				score_final += time_final;
				wait_time = game_get_speed(gamespeed_fps) / 2;
				score_alpha = 1;
			}
		}
	break;
	case 6:
		if (score_total < score_final)
		{
			score_total += round(score_final / 128);
			score_shake = 2;
		}
		else
		{
			if (score_total > score_final) score_total = score_final;
			if (wait_time > 0) wait_time--;
			else
			{
				part++;
				control = true;
			}
		}
	break;
}

if (bebo_dunk_img == 33)
{
	shake_camera(10, 10);
	layer_set_visible("ResultsBG", true);
	layer_set_visible("Instances", false);
	instance_deactivate_layer("Instances");
	sprite_explode(screen, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), layer, 0.25);
	draw_screen = false;
	anim_bg = true;
}

score_shake = lerp(score_shake, 0, 0.2);
boxes_shake = lerp(boxes_shake, 0, 0.2);
bonus_shake = lerp(bonus_shake, 0, 0.2);
time_shake  = lerp(time_shake, 0, 0.2);

if (control)
{
	if (control_alpha > 1)
	{
		control_alpha = 1;
		control_add  *= -1;
	}
	else if (control_alpha < 0)
	{
		control_alpha = 0;
		control_add  *= -1;
	}
	
	control_alpha += control_add;
	
	if (get_button_pressed("action1"))
	{
		control			   = false;
		global.gm_score = score_final;
		
		switch (room)
		{
			case lvl_tutorial2:	    fade(function() { room_goto(lvl_boiler_roof); });		  break;
			case lvl_boiler_roof:   fade(function() { room_goto(lvl_boiler_ground); });		  break;
			case lvl_boiler_ground:	fade(function() { }); break;
		}
	}
}