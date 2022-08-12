state();	//Call state

#region Movement

#region Speed

var move_h = (get_button("right") - get_button("left")),
	bbox_side;

if (move_h != 0)
{
	if (h_spd != move_spd * move_h) h_spd += fric * move_h;
}
else h_spd = max(0, abs(h_spd) - fric) * sign(h_spd);

if (state != state_ride && h_spd != 0) image_xscale = sign(h_spd);

#endregion

x += h_spd;
y += v_spd;

#endregion