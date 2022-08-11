// Returns the name of a given gamepad button
function gamepad_button_name(argument0) {
	switch(argument0){
		case gp_face1:
			return "Face 1";
		case gp_face2:
			return "Face 2";
		case gp_face3:
			return "Face 3";
		case gp_face4:
			return "Face 4";
		case gp_shoulderl:
			return "LB";
		case gp_shoulderlb:
			return "LT";
		case gp_shoulderr:
			return "RB";
		case gp_shoulderrb:
			return "RT";
		case gp_select:
			return "Select";
		case gp_start:
			return "Start";
		case gp_stickl:
			return "Left Stick";
		case gp_stickr:
			return "Right Stick";
		case gp_padu:
			return "DPad Up";
		case gp_padd:
			return "DPad Down";
		case gp_padl:
			return "DPad Left";
		case gp_padr:
			return "DPad Right";
		case gp.lu:
			return "Left Stick Up";
		case gp.ld:
			return "Left Stick Down";
		case gp.ll:
			return "Left Stick Left";
		case gp.lr:
			return "Left Stick Right";
		case gp.ru:
			return "Right Stick Up";
		case gp.rd:
			return "Right Stick Down";
		case gp.rl:
			return "Right Stick Left";
		case gp.rr:
			return "Right Stick Right";
	}
}

// Creates array with all string names of buttons to go with each index
function keyboard_define() {

	/// Keyboard section from David Richard at https://forum.yoyogames.com/index.php?threads/keyboard-layout-key-definitions-for-customized-controls.4276/
	global.asc_def[255] = "Unknown"; // Initialise array of key definitions
	// Build key definitions table
	for (var i=255;i>=0;i--){
		global.asc_def[i] = "Unknown";
	}

	// Set known characters.
	global.asc_def[8] = "Backspace";
	global.asc_def[9] = "Tab";
	global.asc_def[12] = "Numpad 5 (nmlk off)";
	global.asc_def[13] = "Enter";
	global.asc_def[16] = "Shift";
	global.asc_def[19] = "Pause";
	global.asc_def[20] = "Caps lock";
	global.asc_def[27] = "Escape";
	global.asc_def[32] = "Space";
	global.asc_def[33] = "Page up";
	global.asc_def[34] = "Page down";
	global.asc_def[35] = "End";
	global.asc_def[36] = "Home";
	global.asc_def[37] = "Left";
	global.asc_def[38] = "Up";
	global.asc_def[39] = "Right";
	global.asc_def[40] = "Down";
	global.asc_def[45] = "Insert";
	global.asc_def[46] = "Delete";
	global.asc_def[48] = "0";
	global.asc_def[49] = "1";
	global.asc_def[50] = "2";
	global.asc_def[51] = "3";
	global.asc_def[52] = "4";
	global.asc_def[53] = "5";
	global.asc_def[54] = "6";
	global.asc_def[55] = "7";
	global.asc_def[56] = "8";
	global.asc_def[57] = "9";
	global.asc_def[65] = "A";
	global.asc_def[66] = "B";
	global.asc_def[67] = "C";
	global.asc_def[68] = "D";
	global.asc_def[69] = "E";
	global.asc_def[70] = "F";
	global.asc_def[71] = "G";
	global.asc_def[72] = "H";
	global.asc_def[73] = "I";
	global.asc_def[74] = "J";
	global.asc_def[75] = "K";
	global.asc_def[76] = "L";
	global.asc_def[77] = "M";
	global.asc_def[78] = "N";
	global.asc_def[79] = "O";
	global.asc_def[80] = "P";
	global.asc_def[81] = "Q";
	global.asc_def[82] = "R";
	global.asc_def[83] = "S";
	global.asc_def[84] = "T";
	global.asc_def[85] = "U";
	global.asc_def[86] = "V";
	global.asc_def[87] = "W";
	global.asc_def[88] = "X";
	global.asc_def[89] = "Y";
	global.asc_def[90] = "Z";
	global.asc_def[91] = "Windows";
	global.asc_def[96] = "Numpad 0";
	global.asc_def[97] = "Numpad 1";
	global.asc_def[98] = "Numpad 2";
	global.asc_def[99] = "Numpad 3";
	global.asc_def[100] = "Numpad 4";
	global.asc_def[101] = "Numpad 5";
	global.asc_def[102] = "Numpad 6";
	global.asc_def[103] = "Numpad 7";
	global.asc_def[104] = "Numpad 8";
	global.asc_def[105] = "Numpad 9";
	global.asc_def[106] = "Numpad *";
	global.asc_def[107] = "Numpad +";
	global.asc_def[109] = "Numpad -";
	global.asc_def[110] = "Numpad .";
	global.asc_def[111] = "Numpad /";
	global.asc_def[112] = "F1";
	global.asc_def[113] = "F2";
	global.asc_def[114] = "F3";
	global.asc_def[115] = "F4";
	global.asc_def[116] = "F5";
	global.asc_def[117] = "F6";
	global.asc_def[118] = "F7";
	global.asc_def[119] = "F8";
	global.asc_def[120] = "F9";
	global.asc_def[121] = "F10";
	global.asc_def[122] = "F11";
	global.asc_def[123] = "F12";
	global.asc_def[144] = "Num lock";
	global.asc_def[145] = "Scroll lock";
	global.asc_def[160] = "Shift (left)";
	global.asc_def[161] = "Shift (right)";
	global.asc_def[162] = "Ctrl (left)";
	global.asc_def[163] = "Ctrl (right)";
	global.asc_def[164] = "Alt (left)";
	global.asc_def[165] = "Alt (right)";
	global.asc_def[186] = ";";
	global.asc_def[187] = "=";
	global.asc_def[188] = ",";
	global.asc_def[189] = "-";
	global.asc_def[190] = ".";
	global.asc_def[191] = "?";
	global.asc_def[192] = "~";
	global.asc_def[219] = "[";
	global.asc_def[220] = "\\";
	global.asc_def[221] = "]";
	global.asc_def[222] = "'";
}