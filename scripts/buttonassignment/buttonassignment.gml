// Adds inputs to input map
function add_button() {

	//Creates cont if not already existent
	if(!instance_exists(cont)){
		instance_create_depth(0,0,0,cont);
	}

	var bMap;

	//Add a button registry for every argument
	for(i=0;i<argument_count;i++){
		//Creates a map for the button
		bMap = ds_map_create();
	
		var kb = ds_list_create();
		var mb = ds_list_create();
		var gmp = ds_list_create();
		ds_map_add_list(bMap, "kb", kb);
		ds_map_add_list(bMap, "mb", mb);
		ds_map_add_list(bMap, "gp", gmp);

		//Adds map to overall button map
		ds_map_add_map(cont.bt, argument[i], bMap);
	}

}

#region Button assignment
	// Assign a keyboard input to the button
	function button_assign_kb() {

		//Pulls button map from cont object
		var mybt = cont.bt[? argument[0]];

		//Adds every argument to the list of inputs for the given button
		for(var i=1;i<argument_count;i++){
	
			//Check if the button is already in the list
			var _mybutton = argument[i];
			var _add = true;
			for(var j=0;j<ds_list_size(mybt[? "kb"]);j++){
				if(ds_list_find_value(mybt[? "kb"],j) == argument[i]){
					_add = false;
				}
			}
			//Adding to the list if it is not present already
			if(_add) ds_list_add(mybt[? "kb"],_mybutton);
	
			//Returning whether add was successful
			if(argument_count <= 2){
				return _add;
			}
		}
	}
	
	// Assign a mouse input to the button
	function button_assign_mb() {

		//Pulls button map from cont object
		var mybt = cont.bt[? argument[0]];

		//Adds every argument to the list of inputs for the given button
		for(var i=1;i<argument_count;i++){
	
			//Check if the button is already in the list
			var _mybutton = argument[i];
			var _add = true;
			for(var j=0;j<ds_list_size(mybt[? "mb"]);j++){
				if(ds_list_find_value(mybt[? "mb"],j) == argument[i]){
					_add = false;
				}
			}
			//Adding to the list if it is not present already
			if(_add) ds_list_add(mybt[? "mb"],argument[i]);
	
			//Returning whether add was successful
			return _add;
		}
	}
	
	// Assign a gamepad input to the button
	function button_assign_gp() {

		//Pulls button map from cont object
		var mybt = cont.bt[? argument[0]];

		//Adds every argument to the list of inputs for the given button
		for(var i=1;i<argument_count;i++){
	
			//Check if the button is already in the list
			var _mybutton = argument[i];
			var _add = true;
			for(var j=0;j<ds_list_size(mybt[? "gp"]);j++){
				if(ds_list_find_value(mybt[? "gp"],j) == argument[i]){
					_add = false;
				}
			}
			//Adding to the list if it is not present already
			if(_add) ds_list_add(mybt[? "gp"],_mybutton);
	
			//Returning whether add was successful
			if(argument_count <= 2){
				return _add;
			}
		}
	}
	
#endregion

#region Clearing button assignments
	
	// Clearing keyboard assignments
	function button_clear_kb(btn) {

		var mybt = cont.bt[? btn];

		ds_list_clear(mybt[? "kb"]);

	}
	
	// Clearing mouse assignments
	function button_clear_mb(btn) {

		var mybt = cont.bt[? btn];

		ds_list_clear(mybt[? "mb"]);

	}

	
	// Clearing gamepad assignments
	function button_clear_gp(btn) {

		var mybt = cont.bt[? btn];

		ds_list_clear(mybt[? "gp"]);

	}
#endregion

// Set stick threshold
function set_stick_threshold(threshold) {
	cont.stickthresh = threshold;
}
