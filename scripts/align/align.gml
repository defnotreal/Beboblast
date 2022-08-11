/// @function align(halign, valign);
/// @param {index} halign		The horizontal alignment to use
/// @param {index} valign		The vertical alignment to use

/* I made this script to make alignment more efficient
   because the vanilla method provided by YoYo sucks ass lol.
   Be sure to run align_reset() once you're done aligning your stuff. */

function align(hl, vl)
{
	draw_set_halign(hl);
	draw_set_valign(vl);
}