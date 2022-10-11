/// @description Init

cs_name   = "";
sprs	  = [];
cur_spr   = 0;
next_room = -4;
cs_json   = "";

anim_frames       = 0;
anim_img	      = 0;
anim_spd	      = 0;
anim_time         = 0;
anim_length	      = 0;
anim_loop	      = false;
anim_skiponend    = false;
anim_text         = "";
anim_shake_x      = 0;
anim_shake_y      = 0;
anim_shake_dest_x = 0;
anim_shake_dest_y = 0;
anim_shake_snd    = -4;
anim_shake_time   = 0;

text_out = "";
text_pos = 0;
text_writing = false;
text_delay = 1;

#region Functions

function cutscene_advance()
{
	if (cur_spr == array_length(sprs) - 1)
	{
		fade(function() {
			if (next_room == main_menu) audio_stop_sound(global.cur_mus);
			instance_destroy(self);
		});
		exit;
	}
	else cur_spr++;
	
	var obj = variable_struct_get(cs_json, "spr" + string(cur_spr + 1));

	anim_frames    = obj.frames;
	anim_img       = 0;
	anim_spd	   = obj.spd;
	anim_time      = anim_spd;
	anim_length    = obj.length;
	anim_loop	   = obj.loop;
	anim_skiponend = obj.skiponend;
	anim_text	   = obj.text;
	text_out	   = "";
	text_pos	   = 0;
	
	if (variable_struct_exists(obj, "shake"))
	{
		anim_shake_time = obj.shake.time
		anim_shake_dest_x    = obj.shake.shkx;
		anim_shake_dest_y    = obj.shake.shky;
		if (variable_struct_exists(obj.shake, "snd")) anim_shake_snd = obj.shake.snd;
	}
	else
	{
		anim_shake_dest_x   = 0;
		anim_shake_dest_y   = 0;
		anim_shake_snd = -4;
	}
	
	if (anim_text != "") text_writing = true;
}

#endregion