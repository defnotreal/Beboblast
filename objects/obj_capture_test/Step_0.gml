if (get_button("right")) capture_x++;	
else if (get_button("left")) capture_x--;

if (get_button("down"))
{
	if (keyboard_check(vk_shift)) capture_scale += 0.05;
	else capture_y++;
}
else if (get_button("up"))
{
	if (keyboard_check(vk_shift))
	{
		if (capture_scale > 0) capture_scale -= 0.05;
	}
	else capture_y--;
}

if (get_button_pressed("action1")) sprite_explode(global.surf, 0, 0, room_width, room_height);