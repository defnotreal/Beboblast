if (owner.state != owner.state_ride) h_spd = approach(h_spd, 0, fric);

if (v_spd < 10) v_spd += grav;

if (owner.state != owner.state_carry)
{
	rotate -= h_spd;
	
	move();
}