/// @description DRAW IT

draw_text(10, 10, "Input test");
draw_text(10, 50, "Left: " + string(get_button("left")) + "\n" +
				  "Right: " + string(get_button("right")) + "\n" +
				  "Action 1: " + string(get_button("action1")) + "\n" +
				  "Pause: " + string(get_button("pause")));