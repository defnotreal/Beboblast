if (obj_player.state == obj_player.state_carry || obj_player.state == obj_player.state_jump_carry)
{
	obj_player.state = obj_player.state_levelend;
	obj_player.y--;
	obj_player.v_spd = -4;
	
	var b = instance_place(room_width, y, obj_terrain_flat);
	b.image_xscale = 0;
}