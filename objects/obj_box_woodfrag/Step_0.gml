/// @description Move and shit lmao

image_xscale += scale;
image_yscale  = image_xscale;
image_angle  += angle;

if (v_spd < 8) v_spd += 0.4;

x += h_spd;
y += v_spd;