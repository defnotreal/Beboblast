/// @description Move and shit lmao

image_xscale += scale;
image_yscale  = image_xscale;
image_angle  += angle;

if (y > room_height - (sprite_height / 2)) instance_destroy(id); 

if (v_spd < 8) v_spd += 0.4;

x += h_spd;
y += v_spd;