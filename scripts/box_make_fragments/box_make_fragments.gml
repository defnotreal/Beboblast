function box_make_fragments()
{
	if (object_index == obj_box_smallmetal || object_index == obj_box_bigmetal) f = obj_box_metalfrag;
	else f = obj_box_woodfrag;
	
	xx = x - (sprite_width / 2);
	yy = y - sprite_height;
	w  = 0;
	h  = 0;
	
	fragment = function()
	{
		randomize();
		if (irandom(100) < 3) instance_create_depth(xx + w, yy + h, -2, f);
		
		w++;
		if (h <= sprite_height)
		{
			if (w > sprite_width)
			{
				h++;
				w = 0;
			}
			fragment();
		}
	}
	
	fragment();
}