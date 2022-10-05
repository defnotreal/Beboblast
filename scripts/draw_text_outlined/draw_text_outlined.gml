/// @function draw_text_outlined(x, y, string, xscale, yscale, text_color, outline_color, alpha);

function draw_text_outlined(_x, _y, _str, _xs, _ys, _tc, _oc, _a)
{
	draw_set_alpha(_a);
	draw_set_color(_oc);
	
	draw_text_transformed(_x + _xs, _y, _str, _xs, _ys, 0);
	draw_text_transformed(_x - _xs, _y, _str, _xs, _ys, 0);
	draw_text_transformed(_x, _y + _ys, _str, _xs, _ys, 0);
	draw_text_transformed(_x, _y - _ys, _str, _xs, _ys, 0);
	
	draw_set_color(_tc);
	
	draw_text_transformed(_x, _y, _str, _xs, _ys, 0);
	
	draw_set_color(c_white);
	draw_set_alpha(1);
}