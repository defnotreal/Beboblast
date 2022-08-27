/// @description Init

event_inherited();

for (var i = 0; i < room_last; i++;)
{
	menu[i] = room_get_name(i);
}

weed_scale = 1;
spin_mult = -1;