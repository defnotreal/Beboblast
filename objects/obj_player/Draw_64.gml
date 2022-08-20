align(fa_left, fa_bottom);

var inst, g_state;

if (state == state_ride) inst = bomb.collided;
else inst = instance_place(x, y + 1, par_terrain);

if (inst != -4) g_state = string(inst.id) + " (" + object_get_name((inst.object_index)) + ")";
else g_state = "None";


draw_text(10, room_height - 70, string(get_button("left")) + ", " +
								string(get_button("right")) + ", " +
								string(get_button("action1")) + ", " +
								string(get_button("action2")) + ", " +
								string(get_button("pause")));
draw_text(10, room_height - 50, state_name);
draw_text(10, room_height - 30, g_state);
draw_text(10, room_height - 10, string(cam.shake));

align_reset();