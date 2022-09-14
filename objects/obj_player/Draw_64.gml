align(fa_left, fa_bottom);

var inst, g_state;

if (state == state_ride) inst = obj_player_bomb.collided;
else inst = instance_place(x, y + 1, par_terrain);

if (!DEBUG)
{
	if (inst != -4) g_state = string(inst.id) + " (" + object_get_name((inst.object_index)) + ")";
	else g_state = "None";

	var cam_height = camera_get_view_height(view_camera[0]) * 4;

	draw_text(10, cam_height - 90, string(get_button("left")) + ", " +
									string(get_button("right")) + ", " +
									string(get_button("action1")) + ", " +
									string(get_button("action2")) + ", " +
									string(get_button("pause")));
	draw_text(10, cam_height - 70, state_name);
	draw_text(10, cam_height - 50, g_state);
	draw_text(10, cam_height - 30, string(cam.shake_x) + ", " + string(cam.shake_y));
	draw_text(10, cam_height - 10, string(dash));
}

align_reset();