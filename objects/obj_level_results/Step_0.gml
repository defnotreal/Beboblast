if (anim_bg)
{
	var lx = layer_get_x("ResultsBG"),
		ly = layer_get_y("ResultsBG");

	layer_x("ResultsBG", lx - 0.5);
	layer_y("ResultsBG", ly - 0.5);

	if (lx == -63.5)
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
	{
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
			}
		}
	}
}

if (bebo_dunk_img == 33)
{
	shake_camera(10, 10);
	layer_set_visible("ResultsBG", true);
	layer_set_visible("Instances", false);
	anim_bg = true;
}