state();	//Call state

#region Movement

var move_h = (get_button("right") - get_button("left"));

if (move_h != 0)
{
	if (h_spd != move_spd * move_h) h_spd += fric * move_h;
}
else h_spd = max(0, abs(h_spd) - fric) * sign(h_spd);

x += h_spd;

#endregion