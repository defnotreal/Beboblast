if (instance_exists(obj_trans_fade)) instance_destroy(obj_trans_fade);
if (instance_exists(obj_game)) instance_destroy(obj_game);
if (instance_exists(obj_cutscene)) instance_destroy(obj_cutscene);

menu_create(obj_room_selector, 0, 0, fa_left, fa_top, 12);