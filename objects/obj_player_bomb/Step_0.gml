collided = instance_place(x, y + 1, par_terrain);

if (owner.state != owner.state_ride && collided != -4) h_spd = approach(h_spd, 0, fric);

if(collided)
	v_spd = 0;
else if (owner.state != owner.state_carry && owner.state != owner.state_jump_carry) && (v_spd < 10)
	v_spd += grav;

if (owner.state != owner.state_carry)
{
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