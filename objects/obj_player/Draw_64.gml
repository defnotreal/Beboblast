align(fa_left, fa_bottom);

draw_text(10, room_height - 50, string(get_button("left")) + ", " +
								string(get_button("right")) + ", " +
								string(get_button("action1")) + ", " +
								string(get_button("action2")) + ", " +
								string(get_button("pause")));
draw_text(10, room_height - 30, state_name);
draw_text(10, room_height - 10, string(cam.shake));

align_reset();