/// @description Restart level

fade(function() {
	if (room == lvl_tutorial2) room_goto(lvl_tutorial);
	else room_restart();
	instance_destroy(self);
})