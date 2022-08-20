draw_sprite_ext(spr_bomb_placeholder, 0, x, y - (sprite_height / 2) + 1, image_xscale, image_yscale, rotate, c_white, 1);
if (DEBUG) draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 0.5);

draw_set_color(c_red);
draw_circle(x, y + 1, 1, false)
draw_set_color(c_white);