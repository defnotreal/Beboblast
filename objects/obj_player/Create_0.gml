/// @description Init

#region Inputs

add_button("left", "right", "action1", "action2", "pause");

button_assign_kb("left", ord("A"), vk_left);
button_assign_kb("right", ord("D"), vk_right);
button_assign_kb("action1", ord("Z"), ord("J"));
button_assign_kb("action2", ord("X"), ord("K"));
button_assign_kb("pause", vk_escape, vk_enter);

button_assign_gp("left", gp.ll, gp_padl);
button_assign_gp("right", gp.lr, gp_padr);
button_assign_gp("action1", gp_face1);
button_assign_gp("action2", gp_face2, gp_face3);
button_assign_gp("pause", gp_start);

#endregion

#region Movement

h_spd    = 0;
v_spd    = 0;
move_spd = 4;
fric     = 0.4;
anchor_y = y;

#endregion

#region Gameplay

bomb = instance_create_depth(x, y - 15, depth + 1, obj_player_bomb);
bomb.owner = id;

#endregion

#region States

state_free = function()
{
	move_spd = 4;
}

state_carry = function()
{
	bomb.h_spd = 0;
	bomb.x = x;
	bomb.y = y - 32;
	bomb.grav = 0;
}

state_ride = function()
{
	y = bomb.y - 32;
}

state = state_free;

#endregion