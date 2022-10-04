draw_sprite_ext(spr_bebo_dunk, bebo_dunk_img, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),
											  bebo_dunk_y, bebo_dunk_scale, bebo_dunk_scale, 0, c_white, 1);

align(fa_center, fa_top);
draw_text_transformed(camera_get_view_x(view_camera[0])+ (camera_get_view_width(view_camera[0]) / 2), welldone_y,
					  "WELL DONE!!", 2, 2, 0);
align_reset();