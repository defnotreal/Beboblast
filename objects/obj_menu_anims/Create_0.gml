/// @description Init

part = -1;
dest_y = y;

bomb_x = room_width - (room_width / 4);
bomb_anchor_y = y + (room_height - (room_height / 4));
bomb_y = bomb_anchor_y;
bomb_v_spd = 0;
grav = 0.4;
bomb_scale = 0;
black_alpha = 1;


title_x = room_width / 4;
title_anchor_y = floor(y + (room_height / 2.5));
title_y = -(sprite_get_height(spr_menu_title) / 2);
title_v_spd = 0;