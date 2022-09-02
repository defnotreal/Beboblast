/// @function		  fade(speed, on_half);
/// @param {function} on_half	A function that should run when the screen has gone black
/// @param {real}	  speed		The speed at which the fading should occur

function fade(func, spd = 0.05)
{
	var f = instance_create_depth(0, 0, -9999, obj_trans_fade);
	
	f.fade_spd = spd;
	f.on_half = func;
}