event_inherited();

if (get_button_pressed("action1")) && (control)
{
	switch (sel)
	{
		case 0:
			instance_activate_object(obj_game);
			instance_activate_object(obj_player_bomb);
			instance_activate_object(obj_player);
			instance_activate_object(obj_ballbuster);
			audio_resume_sound(global.cur_mus);
			instance_destroy(self);
		break;
		case 1:
			control = false;
			fade(function() { room_goto(main_menu); });
		break;
	}
}

if (get_button_pressed("pause")) && (control)
{
	instance_activate_object(obj_game);
	instance_activate_object(obj_player_bomb);
	instance_activate_object(obj_player);
	instance_activate_object(obj_ballbuster);
	audio_resume_sound(global.cur_mus);
	instance_destroy(self);
}