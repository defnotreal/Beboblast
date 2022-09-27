draw_self();

if (child != -4)
{
	draw_set_color(c_black);
	
	draw_line(x, y - 1, child.x, child.y - 1);
	
	draw_set_color(c_white);
}