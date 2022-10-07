if (!can_hit) exit;

obj_player_bomb.h_spd      = h_spd;
obj_player_bomb.dmg_player = true;
if (h_spd < 0) h_spd *= -1;
can_hit = false;