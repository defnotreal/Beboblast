state();

if (obj_game.game_over) instance_destroy(id);

move();

if (!grounded())
{
	if (v_spd < 8) v_spd += grav;
}
else
{
	v_spd = 0;
}