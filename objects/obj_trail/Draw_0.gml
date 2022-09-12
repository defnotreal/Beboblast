/// @description Draw sprite

draw_set_color(col);

draw_sprite_ext(sprite_index, img, x, y, image_xscale, image_yscale, 0, col, alpha);

draw_set_color(c_white);