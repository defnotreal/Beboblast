draw_sprite_ext(sprs[cur_spr], anim_img, (room_width / 2) + random_range(-anim_shake_x, anim_shake_x), random_range(-anim_shake_y, anim_shake_y), 1.5, 1.5, 0, c_white, 1);

align(fa_center, fa_middle);

draw_text_ext(room_width / 2, room_height - (room_height / 8), text_out, sprite_get_height(spr_font) + 1, 460);

align_reset();