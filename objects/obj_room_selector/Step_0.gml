if (get_button_pressed("action1"))
{
	room_goto(asset_get_index(menu[sel]));
}

if (weed_scale >= 1)
{
	weed_scale = 1;
	spin_mult *= -1;
}
else if (weed_scale <= -1)
{
	weed_scale = -1;
	spin_mult *= -1;
}

weed_scale += 0.01 * spin_mult;

// Inherit the parent event
event_inherited();