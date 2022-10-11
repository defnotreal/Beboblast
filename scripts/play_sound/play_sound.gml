function play_sound(_snd, min_p, max_p)
{
	var f = "sound/" + _snd + ".ogg";
	
	if (file_exists(f)) var snd = audio_create_stream(f);
	
	randomize();
	var s = audio_play_sound_on(global.a_sound, snd, false, 0, audio_emitter_get_gain(global.a_sound));
	audio_sound_pitch(s, random_range(min_p, max_p));
	
	return s;
}