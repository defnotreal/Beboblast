randomize();

var cam_x = camera_get_view_x(view_camera[0]),
	cam_y = camera_get_view_y(view_camera[0]),
	cam_w = camera_get_view_width(view_camera[0]),
	cam_h = camera_get_view_height(view_camera[0]);
	
if (draw_screen) draw_sprite_ext(screen, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 0.25, 0.25, 0, c_white, 1);

draw_sprite_ext(spr_bebo_dunk, bebo_dunk_img, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),
											  bebo_dunk_y, bebo_dunk_scale, bebo_dunk_scale, 0, c_white, 1);

align(fa_center, fa_middle);

draw_text_outlined(cam_x + (cam_w / 2), welldone_y, "WELL DONE!!", 2, 2, c_white, c_black, 1);
draw_text_outlined(cam_x + (cam_w / 2), (cam_y + (cam_h / 2)) - (cam_h / 12), "Boxes", 1, 1, c_white, c_black, boxes_alpha);
draw_text_outlined((cam_x + (cam_w / 2)) + random_range(-boxes_shake, boxes_shake), (cam_y + (cam_h / 2)) + random_range(-boxes_shake, boxes_shake), string(boxes_total) + "/" + string(obj_game.lvl_totalboxes), 1, 1, c_white, c_black, boxes_alpha);

if (boxes_total == obj_game.lvl_totalboxes) draw_text_outlined(((cam_x + (cam_w / 2)) + (string_width(string(obj_game.lvl_boxeskilled) + "/" + string(obj_game.lvl_totalboxes)) * 1.4)) + random_range(-bonus_shake, bonus_shake), ((cam_y + (cam_h / 2))) + random_range(-bonus_shake, bonus_shake), "+1000", 1, 1, c_lime, c_black, bonus_alpha);

draw_text_outlined(cam_x + (cam_w / 2), cam_y + (cam_h / 1.6), "Time Bonus", 1, 1, c_white, c_black, time_alpha);
draw_text_outlined(cam_x + (cam_w / 2) + random_range(-time_shake, time_shake), cam_y + (cam_h / 1.4) + random_range(-time_shake, time_shake), string(time_total), 1, 1, c_white, c_black, time_alpha);

draw_text_outlined(cam_x + (cam_w / 2), cam_y + floor(cam_h / 1.2), "Final Score", 1, 1, c_white, c_black, score_alpha);
draw_text_outlined((cam_x + (cam_w / 2)) + random_range(-score_shake, score_shake), (cam_y + floor(cam_h / 1.08))  + random_range(-score_shake, score_shake), string(score_total), 1, 1, c_white, c_black, score_alpha);

if (control)
{
	align(fa_right, fa_middle);
	draw_text_outlined((cam_x + (cam_w - 10)), (cam_y + (cam_h - 10)), "Press Action 1 to continue!", 0.5, 0.5, c_white, c_black, control_alpha);
}

draw_set_alpha(1);
align_reset();