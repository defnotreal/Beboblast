/// @description All-around return to free state

if (state == state_dash) dash_timer = game_get_speed(gamespeed_fps) / 3;
state = state_free;