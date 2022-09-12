/// @function					make_trail(subimg, col, alpha, fade);
/// @param {real}				img
/// @param {constant.color}		col
/// @param {real}				alpha
/// @param {real}				fade

function make_trail(_img, _col, _alpha = 0.5, _fade = 0.05)
{
	var t = instance_create_depth(x, y, depth + 1, obj_trail);
	t.sprite_index = sprite_index;
	t.image_xscale = image_xscale;
	
	with (t)
	{
		img		 = _img;
		col		 = _col;
		alpha    = _alpha;
		fade_spd = _fade;
	}
}