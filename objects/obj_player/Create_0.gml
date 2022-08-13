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
grav = 0.2;
tilemap = layer_tilemap_get_id("Collisions");

#endregion

#region Gameplay

bomb = instance_create_depth(x, bbox_top - 10, depth + 1, obj_player_bomb);
bomb.owner = id;
cam = instance_create_depth(x, y - (sprite_height / 2), 0, obj_player_camera);

#endregion

#region States

state_free = function()
{
	sprite_index = spr_player;
	move_spd = 4;
	fric = 0.4;
}

state_dash = function()
{
	sprite_index = spr_player;
	move_spd = 6;
	h_spd = move_spd * image_xscale;
}

state_carry = function()
{
	sprite_index = spr_player_carry;
	bomb.h_spd = 0;
	bomb.grav = 0;
}

state_ride = function()
{
	sprite_index = spr_player_ride;
	bomb.grav = 0.2;
	move_spd = 8;
	fric = 0.075;
	bomb.h_spd = h_spd;
}

state = state_free;

#endregion