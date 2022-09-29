if (state == state_overdrive || state == state_overdrive_carry) gpu_set_fog(true, c_white, 0, 0);
draw_sprite_ext(cur_spr, cur_img, x, y, image_xscale, 1, 0, c_white, 1);
gpu_set_fog(false, c_white, 0, 0);

if (!global.debug) exit;

draw_self();

align(fa_right, fa_bottom);
draw_text(x - 17, y - (sprite_height) - 1, string(h_spd));
align(fa_left, fa_bottom);
draw_text(x + 17, y - (sprite_height) - 1, string(v_spd));
align(fa_center, fa_bottom);
draw_text(x, y - (sprite_height) - 17, string(ground_spd));

align(fa_center, fa_middle);

draw_circle_color(x + (16 * sign(h_spd)), y + 1, 1, c_red, c_red, false)