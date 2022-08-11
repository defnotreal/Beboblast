align(fa_left, fa_bottom);

draw_text(10, room_height - 10, string(get_button("left")) + ", " +
								string(get_button("right")) + ", " +
								string(get_button("action1")) + ", " +
								string(get_button("action2")) + ", " +
								string(get_button("pause")));
								
align_reset();