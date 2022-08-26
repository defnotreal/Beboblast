/// @function menu_create(type, xpos, ypos, halign, valign, offset);

/// @param {Asset.GMObject}  type    The type of menu to create
/// @param {Real}			 xpos    The x position at which to start drawing the menu
/// @param {Real}			 ypos    The x position at which to start drawing the menu
/// @param {Constant.HAlign} halign  The horizonatal alignment of the menu options
/// @param {Constant.VAlign} valign  The vertical alignment of the menu options
/// @param {Real}			 offset  How far apart each menu option should be

function menu_create(type, _x, _y, _h, _v,  o = 24)
{
	if (object_get_parent(type) != par_menu) ||
	   (type == par_menu) exit;
	   
	var m = instance_create_depth(0, 0, 0, type);
	with (m)
	{
		x_pos  = _x;
		y_pos  = _y;
		y_off  = o;
		halign = _h;
		valign = _v;
	}
	
	return m;
}