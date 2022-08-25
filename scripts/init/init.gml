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

var cap = "BEBO BLOWS IT!";
if (DEBUG) cap = cap + " (DEBUG)";
window_set_caption(cap);