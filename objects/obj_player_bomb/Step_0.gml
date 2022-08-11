if (owner.state != owner.state_free) h_spd = owner.h_spd;
else h_spd = max(0, abs(h_spd) - (fric / 4)) * sign(h_spd);

x += h_spd;
if (owner.state != owner.state_carry) image_angle -= h_spd;