function play_music(_mus, _l = true)
{
	var f = "music/" + _mus + ".ogg";
	
	if (audio_is_playing(global.cur_mus)) audio_stop_sound(global.cur_mus);
	if (file_exists(f)) var snd = audio_create_stream(f);
	global.cur_mus = audio_play_sound_on(global.a_music, snd, _l, 0, audio_emitter_get_gain(global.a_music));
}