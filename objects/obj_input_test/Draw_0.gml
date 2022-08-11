/// @description DRAW IT

draw_text(10, 10, "Input test");
draw_text(10, 50, "Left: " + string(keyboard_check(keys.left)) + "\n" +
				  "Right: " + string(keyboard_check(keys.right)) + "\n" +
				  "Z: " + string(keyboard_check(keys.jump)) + "\n" +
				  "Enter: " + string(keyboard_check(keys.start)));