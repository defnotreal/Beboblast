
// Saving controls to json file
function controls_save(filename) {

	var _string = json_encode(cont.bt);
	show_message(_string);

	var buffer = buffer_create( string_byte_length(_string)+1, buffer_fixed, 1);
	buffer_write( buffer, buffer_string, _string);
	buffer_save( buffer, filename);
	buffer_delete( buffer);

}

// Loading controls from json file
function controls_load(filename) {

	var buffer = buffer_load(filename);
	var _string = buffer_read(buffer, buffer_string);
	buffer_delete(buffer);

	var map = json_decode(_string);
	return map;

}

// Returns list of all buttons for a given input in human readable format
/// @param button
/// @param "kb"/"mb"/"gp"
function get_button_assignment(button, inputtype) {

	var _buttons = ds_map_find_value(cont.bt[? button], inputtype);

	var _readlist = ds_list_create();

	switch(inputtype){

		case "kb":
			for(var i=0;i<ds_list_size(_buttons);i++){
				var _name = global.asc_def[ds_list_find_value(_buttons,i)];
				ds_list_add(_readlist,_name);
			}
			break;
		case "mb":
			for(var i=0;i<ds_list_size(_buttons);i++){
				var _name = "M"+string(ds_list_find_value(_buttons,i));
				ds_list_add(_readlist,_name);
			}
			break;
		case "gp":
			for(var i=0;i<ds_list_size(_buttons);i++){
				var _name = gamepad_button_name(ds_list_find_value(_buttons,i));
				ds_list_add(_readlist,_name);
			}
			break;

	}

	return _readlist;
	
}