/// @description Init

menu[0] = "Start";
menu[1] = "Options";
menu[2] = "Quit";
sel     = 0;

add_button("up", "down", "action1", "action2");

button_assign_kb("up", vk_up, ord("W"));
button_assign_kb("down", vk_down, ord("S"));
button_assign_kb("action1", ord("Z"), ord("J"));
button_assign_kb("action2", ord("X"), ord("K"));

button_assign_gp("up", gp.lu, gp_padu);
button_assign_gp("down", gp.ld, gp_padd);
button_assign_gp("action1", gp_face1);
button_assign_gp("action2", gp_face2);