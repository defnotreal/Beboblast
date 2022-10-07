function sprite_explode(_spr, _x1, _y1, _x2, _y2, _lay, _sc = 1)
{
	randomize();
	for (var i = 0; i < sprite_get_width(_spr) / 4; i++;)
	{
		var p = instance_create_layer(random_range(_x1, _x2), random_range(_y1, _y2), _lay, obj_capture_piece)
		
		with (p)
		{
			randomize();
			
			spr    = _spr;
			left   = irandom_range(0, sprite_get_width(_spr) / 1.5);
			top    = irandom_range(0, sprite_get_height(_spr) / 1.5);
			width  = irandom_range(10, 100);
			height = irandom_range(10, 100);
			image_xscale = _sc;
			image_yscale = _sc;
		}
	}
}