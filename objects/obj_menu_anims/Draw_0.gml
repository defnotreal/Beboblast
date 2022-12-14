draw_sprite_ext(spr_menu_bomb, bomb_img, bomb_x, bomb_y, bomb_scale, bomb_scale, 0, c_white, 1);
draw_sprite_ext(bebo_spr, bebo_img, bomb_x, bebo_y, bomb_scale, bomb_scale, 0, c_white, 1);
draw_sprite_ext(spr_menu_title, 0, title_x, title_y, 1, 1, 0, c_white, title_alpha);
					 
draw_set_alpha(black_alpha);
draw_rectangle_color(0, 0, room_width, room_height,
					 c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

if (!global.debug) exit;

align(fa_center, fa_middle);

draw_text(bomb_x, bomb_anchor_y, string(bomb_scale));
draw_text(title_x, title_anchor_y, string(title_v_spd));
draw_text(bomb_x, bomb_y - (bomb_y / 3), string(bebo_v_spd));

align_reset();