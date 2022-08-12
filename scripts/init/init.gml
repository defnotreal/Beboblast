#macro DEBUG     true
#macro TILE_SIZE 16

global.inputs =
{
	right : vk_right,
	left  : vk_left,
	jump  : ord("Z"),
	start : vk_enter
}

global.cam = camera_create();
camera_set_view_size(global.cam, 320, 180);