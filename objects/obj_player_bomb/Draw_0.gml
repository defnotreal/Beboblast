draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, rotate, c_white, 1);

align(fa_center, fa_middle);
draw_text(x, y, object_get_name(owner.object_index));
align_reset();