if (owner.state != owner.state_ride) h_spd = max(0, abs(h_spd) - fric / 8) * sign(h_spd);

if (v_spd < 10) v_spd += grav;

if (owner.state != owner.state_carry) rotate -= h_spd;
move();