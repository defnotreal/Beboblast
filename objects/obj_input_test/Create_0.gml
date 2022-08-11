/// @description Init

//keys = global.inputs;

// These names are just for us to keep track, they can be anything we want
add_button("left","right","action1","pause");

button_assign_kb("left",ord("A"),vk_left);
button_assign_kb("right",ord("D"),vk_right);
button_assign_kb("action1",ord("Z"),ord("J"));
button_assign_kb("pause",vk_escape,vk_enter);

button_assign_gp("left",gp.ll,gp_padl);
button_assign_gp("right",gp.lr,gp_padr);
button_assign_gp("action1",gp_face1,);
button_assign_gp("pause",gp_start);
