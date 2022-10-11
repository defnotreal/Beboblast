if (get_button("left"))
{
	switch (sel)
	{
		case 0:
			var vol = audio_emitter_get_gain(global.a_music);
			if (vol > 0) audio_emitter_gain(global.a_music, vol - 0.01);
			audio_sound_gain(global.cur_mus, audio_emitter_get_gain(global.a_music), 0);
		break;
		case 1:
			var vol = audio_emitter_get_gain(global.a_sound);
			if (vol > 0)
			{
				audio_emitter_gain(global.a_sound, vol - 0.01);
				if (!audio_is_playing(ind)) audio_play_sound_on(global.a_sound, ind, false, 0, audio_emitter_get_gain(global.a_sound), 0, random_range(0.8, 1.1));
			}
		break;
	}
}
if (get_button("right"))
{
	switch (sel)
	{
		case 0:
			var vol = audio_emitter_get_gain(global.a_music);
			if (vol < 1) audio_emitter_gain(global.a_music, vol + 0.01);
			audio_sound_gain(global.cur_mus, audio_emitter_get_gain(global.a_music), 0);
		break;
		case 1:
			var vol = audio_emitter_get_gain(global.a_sound);
			if (vol < 1)
			{
				audio_emitter_gain(global.a_sound, vol + 0.01);
				if (!audio_is_playing(ind)) audio_play_sound_on(global.a_sound, ind, false, 0, audio_emitter_get_gain(global.a_sound), 0, random_range(0.8, 1.1));
			}
		break;
	}
}
if (get_button_pressed("action1"))
{
	if (sel == 2) go_tf_back();
}
if (get_button_pressed("action2")) go_tf_back();

// Inherit the parent event
event_inherited();