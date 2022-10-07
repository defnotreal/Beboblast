if (!can_hit) exit;

obj_player.damage();
if (h_spd < 0) h_spd *= -1;
can_hit = false;