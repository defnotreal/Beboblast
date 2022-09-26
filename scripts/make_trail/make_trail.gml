/// @function					make_trail(subimg, col, alpha, fade);
/// @param {asset.GMSprite}		spr
/// @param {real}				img
/// @param {constant.Color}		col
/// @param {real}				alpha
/// @param {real}				fade

function make_trail(_spr, _img, _col, _alpha = 0.5, _fade = 0.05)
{
	var yy;
	if (object_index == obj_player_bomb) yy = y - 28;
	else yy = y;
	
	var t = instance_create_depth(x, yy, depth + 1, obj_trail);
	
	with (t)
	{
		spr      = _spr;
		img		 = _img;
		col		 = _col;
		alpha    = _alpha;
		fade_spd = _fade;
	}
	
	t.image_xscale = image_xscale;
	if (object_index == obj_player_bomb) t.image_angle  = obj_player_bomb.rotate;
}