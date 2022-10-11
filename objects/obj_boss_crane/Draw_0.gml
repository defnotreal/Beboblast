
draw_sprite_ext(sprite_index, img, x, y, 1, 1, 0, c_white, alpha);

if (!global.debug) exit;

align(fa_center, fa_bottom);
draw_text_outlined(x, y - 80, state_name, 1, 1, c_white, c_black, 1);
align_reset();