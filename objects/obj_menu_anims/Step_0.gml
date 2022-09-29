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

if (bebo_spr == spr_menu_bebo2 || bebo_spr == spr_menu_bebo3)
{
	if (bebo_img_spd > 0) bebo_img_spd--;
	else
	{	
		if (bebo_img > 3) bebo_img = 0 + (bebo_spr == spr_menu_bebo3);
		else bebo_img++;
		
		if (bebo_spr == spr_menu_bebo3) bebo_img_spd = game_get_speed(gamespeed_fps) / 6;
		else bebo_img_spd = game_get_speed(gamespeed_fps) / 64;
	}
}

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
		bomb_scale += 0.05;
		if (bomb_img_spd > 0) bomb_img_spd--;
		else
		{
			if (bomb_img == sprite_get_number(spr_menu_bomb) - 1) bomb_img = 0;
			else bomb_img++;
			bomb_img_spd = 1;
		}
		bebo_anchor_y = bomb_y;
		bebo_y = bebo_anchor_y;
		if (bomb_scale > 1.5)
		{
			part++;
			shake_camera(3, 3);
			bomb_v_spd = -12;
			bebo_v_spd = -34;
			bebo_img = 1;
			bebo_anchor_y = bomb_y - (bomb_y / 3);
		}
	break;
	case 1:
		if (bomb_v_spd < 10) bomb_v_spd += grav;
		bomb_scale -= 0.008;
		if (bomb_img_spd > 0) bomb_img_spd--;
		else
		{
			if (bomb_img == sprite_get_number(spr_menu_bomb) - 1) bomb_img = 0;
			else bomb_img++;
			bomb_img_spd = 1;
		}
		
		if (bomb_y >= bomb_anchor_y)
		{
			part++;
			shake_camera(0, 200);
			bomb_scale = 1;
			bomb_y = bomb_anchor_y;
			bomb_v_spd = 0;
			bomb_img = 0;
			bebo_spr = spr_menu_bebo2;
			bebo_img = 0;
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
				
				menu_create(obj_main_menu, room_width / 4, (room_height / 2) + (room_height / 16), fa_center, fa_middle);
			}
		}
	break;
	case 3:
		bebo_img_spd = game_get_speed(gamespeed_fps) / 8;
		if (bebo_y > bebo_anchor_y)
		{
			if (bebo_spr != spr_menu_bebo3)
			{
				bebo_spr = spr_menu_bebo3;
				bebo_img = 0;
			}
			bebo_y = bebo_anchor_y - 1;
			bebo_v_spd = -bebo_v_spd + 6;
			bebo_img_spd = game_get_speed(gamespeed_fps) / 16;
			
			if (bebo_v_spd > 0)
			{
				part++;
				bebo_v_spd = 0;
				bebo_y = bebo_anchor_y;
				bebo_spr = spr_menu_bebo3;
				bebo_img = 1;
				bebo_img_spd = game_get_speed(gamespeed_fps) / 16;
			}
		}
	break;
}

if (bebo_v_spd < 10) && (part <= 3) && (part > 0) bebo_v_spd += grav;
if (get_button_pressed("action1")) && (part <= 2) && (part > -4) skip_intro();

#endregion

bomb_y  += bomb_v_spd;
bebo_y  += bebo_v_spd;
title_y += title_v_spd;
y		 = lerp(y, dest_y, 0.2);