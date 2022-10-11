if(damage_timer <= 0 &&
	!(obj_player.state == obj_player.state_dash || obj_player.state == obj_player.state_overdrive))
		&& (!dead)
{
	obj_player.damage();
	damage_timer = damage_cooldown;
}