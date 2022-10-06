align(fa_left, fa_bottom);

draw_text_outlined(10, room_height - 70, "X: " + string(capture_x), 2, 2, c_white, c_black, 1);
draw_text_outlined(10, room_height - 40, "Y: " + string(capture_y), 2, 2, c_white, c_black, 1);
draw_text_outlined(10, room_height - 10, "Scale: " + string(capture_scale), 2, 2, c_white, c_black, 1);

align_reset();