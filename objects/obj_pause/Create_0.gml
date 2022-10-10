/// @description Init

event_inherited();
instance_deactivate_object(obj_game);
audio_pause_sound(global.cur_mus);

shake_camera(1, 1);
play_sound("snd_punch", 0.8, 1.1);

menu[0] = "Resume";
menu[1] = "Quit";