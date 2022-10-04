function cutscene_start(_name, _next)
{
	if (!directory_exists("cutscenes/" + _name)) exit;
	
	var c = instance_create_depth(0, 0, -9999, obj_cutscene);
	c.cs_name   = _name;
	c.next_room = _next;
		
	var f	  = file_find_first("cutscenes/" + _name + "/*.png", 0),
		f_num = 0,
		s	  = -4,
		buf  = buffer_load("cutscenes/" + _name + "/scene.json"),
		data = buffer_read(buf, buffer_string);
	c.cs_json = json_parse(data);
	
	buffer_delete(buf);
	
	show_debug_message("Cutscene JSON found: " + json_stringify(c.cs_json));
	
	with (c)
	{
		var obj = variable_struct_get(cs_json, "spr1");
		
		anim_frames    = obj.frames;
		anim_spd	   = obj.spd;
		anim_time	   = anim_spd;
		anim_length	   = obj.length;
		anim_loop	   = obj.loop;
		anim_skiponend = obj.skiponend;
		anim_text	   = obj.text;
		
		if (anim_text != "") text_writing = true;
	}
	
	while (f != "")
	{
		f_num++;
		var obj = variable_struct_get(c.cs_json, "spr" + string(f_num));
		s = sprite_add("cutscenes/" + _name + "/" + string(f_num) + ".png", obj.frames, false, false, 160, 0);
		array_push(c.sprs, s);
			
		f = file_find_next();
	}
	
	room_goto(cutscene);
}