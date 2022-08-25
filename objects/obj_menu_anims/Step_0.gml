#region Loop background

var lx = layer_get_x("Background"),
	ly = layer_get_y("Background");

layer_x("Background", lx - 0.5);
layer_y("Background", ly - 0.5);

if (lx == -63.5)
{
	layer_x("Background", 0);
	layer_y("Background", 0);
}

#endregion

#region Animating

switch (part)
{
	case -1:
		black_alpha -= 0.025;
		if (black_alpha < 0)
		{
			part++;
			black_alpha = 0;
		}
	break;
	case 0:
		if (bomb_scale < 1.5) bomb_scale += 0.05;
		else
		{
			part++;
			shake_camera(3, 3);
			bomb_v_spd = -12;
		}
	break;
	case 1:
		if (bomb_v_spd < 10) bomb_v_spd += grav;
		bomb_scale -= 0.008;
		
		if (bomb_y >= bomb_anchor_y)
		{
			part++;
			shake_camera(0, 200);
			bomb_scale = 1;
			bomb_y = bomb_anchor_y;
			bomb_v_spd = 0;
			title_v_spd = -10;
		}
	break;
	case 2:
		if (title_v_spd < 10) title_v_spd += grav;
		if (title_y > title_anchor_y)
		{
			title_y = title_anchor_y - 1;
			title_v_spd = -title_v_spd + 3;
			
			if (title_v_spd > 0)
			{
				part++;
				title_v_spd = 0;
				title_y = title_anchor_y;
				instance_create_depth(0, 0, 0, obj_main_menu);
			}
		}
	break;
}

#endregion

bomb_y  += bomb_v_spd;
title_y += title_v_spd;
y = lerp(y, dest_y, 0.2);