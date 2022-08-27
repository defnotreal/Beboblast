///Returns whether any input for the given button is held down
function get_button(btn) {

	//Pull the button map from the cont object
	var mybtn = cont.bt[? btn];
	
	#region Checking inputs against lists from button map
		//Pull keyboard input list from button map
		var keylist = mybtn[? "kb"];
		//Iterate through list to check all inputs
		for(i=0;i<ds_list_size(keylist);i++){
			if(keyboard_check(keylist[| i])){
				return true;
			}
		}

		//Pull keyboard input list from button map
		var mouselist = mybtn[? "mb"];
		//Iterate through list to check all inputs
		for(i=0;i<ds_list_size(mouselist);i++){
			if(mouse_check_button(mouselist[| i])){
				return true;
			}
		}

		//Pull gamepad input list from button map
		var gplist = mybtn[? "gp"];
		//Iterate through list to check all inputs
		for(i=0;i<ds_list_size(gplist);i++){
			if(gp_check(gplist[| i])){
				return true;
			}
		}

	#endregion
	
	//Return false if no inputs were triggered
	return false;

}

///Returns whether any input for the given button is held down
function get_button_pressed(btn) {

	//Pull the button map from the cont object
	var mybtn = cont.bt[? btn];

	#region Checking inputs against lists from button map
        //Pull keyboard input list from button map
        var keylist = mybtn[? "kb"];
        //Iterate through list to check all inputs
        for(i=0;i<ds_list_size(keylist);i++){
            if(keyboard_check_pressed(keylist[| i])){
                return true;
            }
        }

        //Pull keyboard input list from button map
        var mouselist = mybtn[? "mb"];
        //Iterate through list to check all inputs
        for(i=0;i<ds_list_size(mouselist);i++){
            if(mouse_check_button_pressed(mouselist[| i])){
                return true;
            }
        }

        //Pull gamepad input list from button map
        var gplist = mybtn[? "gp"];
        //Iterate through list to check all inputs
        for(i=0;i<ds_list_size(gplist);i++){
            if(gp_check_pressed(gplist[| i])){
                return true;
            }
        }

    #endregion

    //Return false if no inputs were triggered
    return false;

}

///Returns whether any input for the given button is held down
function get_button_released(btn) {

	//Pull the button map from the cont object
	var mybtn = cont.bt[? btn];

	#region Checking inputs against lists from button map
		//Pull keyboard input list from button map
		var keylist = mybtn[? "kb"];
		//Iterate through list to check all inputs
		for(i=0;i<ds_list_size(keylist);i++){
			if(keyboard_check_released(keylist[| i])){
				return true;
			}
		}

		//Pull keyboard input list from button map
		var mouselist = mybtn[? "mb"];
		//Iterate through list to check all inputs
		for(i=0;i<ds_list_size(mouselist);i++){
			if(mouse_check_button_released(mouselist[| i])){
				return true;
			}
		}

		//Pull gamepad input list from button map
		var gplist = mybtn[? "gp"];
		//Iterate through list to check all inputs
		for(i=0;i<ds_list_size(gplist);i++){
			if(gp_check_released(gplist[| i])){
				return true;
			}
		}
	#endregion

	//Return false if no inputs were triggered
	return false;

}
