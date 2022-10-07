collided = instance_place(x, y + 1, par_terrain);

if (h_spd > 8 || h_spd < -8) make_trail(spr_bomb, 0, c_white);

if(collided)
{
	if (collided.object_index == obj_boost_pad) h_spd = 16 * collided.image_xscale;
	if (dmg_player) dmg_player = false;
	v_spd = 0;
}
else if (owner.state != owner.state_carry && owner.state != owner.state_jump_carry) && (v_spd < 10)
	v_spd += grav;
	
if (owner.state != owner.state_ride)
{	
	var slope_l, slope_s1, slope_s2, slope_next;
	slope_l	 = instance_place(x, y + 1, obj_terrain_slope1);
	slope_s1 = instance_place(x, y + 1, obj_terrain_slope2_1);
	slope_s2 = instance_place(x, y + 1, obj_terrain_slope2_2);
		
	if (slope_l != -4)
	{
		h_spd += 0.25 * slope_l.image_xscale;
		if (slope_l.image_xscale == -sign(h_spd))
		{
			slope_next = instance_position(slope_l.x - (8 * slope_l.image_xscale), y - 8, par_terrain);

			if (slope_next == -4 || slope_next.object_index = obj_terrain_slope2_1)
			{
				if (x != slope_l.x) && (y >= slope_l.y + 1) v_spd = -(abs(h_spd));
			}
		}
	}
	else if (slope_s1 != -4)
	{
		h_spd += 0.1 * slope_s1.image_xscale;
		if (slope_s1.image_xscale == -sign(h_spd))
		{
			slope_next = instance_position(slope_s1.x - (8 * slope_s1.image_xscale), y - 4, par_terrain);

			if (slope_next == -4)
			{
				if (x != slope_s1.x) && (y >= slope_s1.y) v_spd = -(abs(h_spd)) / 2;
			}
		}
	}
	else if (slope_s2 != -4)
	{
		h_spd += 0.12 * slope_s2.image_xscale;
		if (slope_s2.image_xscale == -sign(h_spd))
		{
			slope_next = instance_position(slope_s2.x - (8 * slope_s2.image_xscale), y - 8, par_terrain);

			if (slope_next == -4)
			{
				if (x != slope_s2.x) && (y >= slope_s2.y) v_spd = -(abs(h_spd)) / 2;
			}
		}
	}
}

if (owner.state != owner.state_ride && instance_place(x, y + 1, obj_terrain_flat) != -4) h_spd = approach(h_spd, 0, fric);

if (owner.state != owner.state_carry && owner.state != owner.state_jump_carry)
{
	var smallwood  = instance_place(x + h_spd, y + 2, obj_box_smallwood),
		bigwood	   = instance_place(x + h_spd, y + 2, obj_box_bigwood),
		smallmetal = instance_place(x + h_spd, y + 2, obj_box_smallmetal),
		bigmetal   = instance_place(x + h_spd, y + 2, obj_box_bigmetal);
		
	if (h_spd > 3 || h_spd < -3)
	{
		if (smallwood != noone)  instance_destroy(smallwood);
		if (bigwood != noone)	 instance_destroy(bigwood);
		if (smallmetal != noone) instance_destroy(smallmetal);
		if (bigmetal != noone)   instance_destroy(bigmetal);
	}
	
	rotate -= h_spd;
	
	move();
}

if(owner.state == owner.state_carry || owner.state == owner.state_jump_carry)
{
	while(rotate < 0) rotate += 360;
	rotate = rotate % 360;
	if(rotate > 60)
	{
		if(rotate < 110) rotate = 60;
		else if(rotate < 160) rotate = 160;
	}
}