x = lerp(x, dest_x, 0.02);
y = lerp(y, dest_y, 0.02);

if (obj_hooked != -4)
{
	obj_hooked.x = x;
	obj_hooked.y = y + (sprite_height * 2);
	
	if (x >= owner.child.x - 8)
	{
		show_debug_message("Unhook");
		obj_hooked = -4;
		show_debug_message(obj_hooked);
	}
}