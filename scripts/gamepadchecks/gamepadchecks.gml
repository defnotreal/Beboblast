
// Gamepad button check
function gp_check(button) {
	//If input is stick, check stick array from cont object
	if(button >= 1000 && button < gp.length){
		return cont.sticks[button-1000,bState.held];
	} else {
		return gamepad_button_check(gps, button);
	}
}

// Gamepad button check pressed
function gp_check_pressed(button) {
	//If input is stick, check stick array from cont object
	if(button >= 1000 && button < gp.length){
		return cont.sticks[button-1000,bState.pressed];
	} else {
		return gamepad_button_check_pressed(gps, button);
	}
}

// Gamepad button check released
function gp_check_released(button) {
	//If input is stick, check stick array from cont object
	if(button >= 1000 && button < gp.length){
		return cont.sticks[button-1000,bState.released];
	} else {
		return gamepad_button_check_released(gps, button);
	}
}

/// @description Returns highest priority slot with gamepad
function scr_gp_s() {
	for(i=0;i<12;i++){
		if(gamepad_is_connected(i)) return i;
	}
	return 0;
}

