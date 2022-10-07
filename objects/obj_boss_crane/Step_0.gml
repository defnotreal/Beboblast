state();

if (do_anim)
{
	if (anim_time > 0) anim_time--;
	else
	{
		if (img == sprite_get_number(sprite_index) - 1) img = 0;
		else img++;
		anim_time = 5;
	}
}

if (state != state_intro && state != state_hurt && state != state_dead)
{
	if (place_meeting(x - 24, y, obj_player_bomb)) && (obj_player_bomb.h_spd > 3) damage();
}

if (!instance_exists(obj_boss_claw)) && (state != state_intro && state != state_dead)
{
	if (claw_time > 0) claw_time --;
	else
	{
		instance_create_layer(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2), -sprite_get_height(spr_boss_claw), "Instances", obj_boss_claw);
		claw_time = game_get_speed(gamespeed_fps) * 10;
	}
}