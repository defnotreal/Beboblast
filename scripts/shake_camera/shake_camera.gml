/// @function            shake_camera(xspeed, yspeed);
/// @param {real} xspeed The horizontal speed to shake the camera
/// @param {real} yspeed The vertical speed to shake the camera

function shake_camera(_x, _y)
{
	with (obj_camera)
	{
		shake_x = _x;
		shake_y = _y;
	}
}