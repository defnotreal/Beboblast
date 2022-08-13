draw_self();

align(fa_right, fa_bottom);
draw_text(x - 17, y - (sprite_height) - 1, string(h_spd));
align(fa_left, fa_bottom);
draw_text(x + 17, y - (sprite_height) - 1, string(v_spd));

align_reset();