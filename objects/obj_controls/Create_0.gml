/// @description Init

event_inherited();

ini_open("data/settings.ini");
menu[0, 0] = "Up";
menu[0, 1] = ini_read_real("Controls", "up", vk_up);
menu[1, 0] = "Down";
menu[1, 1] = ini_read_real("Controls", "down", vk_down);
menu[2, 0] = "Left";
menu[2, 1] = ini_read_real("Controls", "left", vk_left);
menu[3, 0] = "Right";
menu[3, 1] = ini_read_real("Controls", "right", vk_right);
menu[4, 0] = "Action 1";
menu[4, 1] = ini_read_real("Controls", "action1", ord("Z"));
menu[5, 0] = "Action 2";
menu[5, 1] = ini_read_real("Controls", "action2", ord("X"));
menu[6, 0] = "Start";
menu[6, 1] = ini_read_real("Controls", "pause", vk_enter);
ini_close();

binding	   = false;

get_key = function(key)
{
	switch (key)
	{
		case ord("A"): return "A";		      break;
		case ord("B"): return "B";			  break;
		case ord("C"): return "C";			  break;
		case ord("D"): return "D";			  break;
		case ord("E"): return "E";			  break;
		case ord("F"): return "F";			  break;
		case ord("G"): return "G";			  break;
		case ord("H"): return "H";			  break;
		case ord("I"): return "I";			  break;
		case ord("J"): return "J";			  break;
		case ord("K"): return "K";			  break;
		case ord("L"): return "L";			  break;
		case ord("M"): return "M";			  break;
		case ord("N"): return "N";			  break;
		case ord("O"): return "O";			  break;
		case ord("P"): return "P";			  break;
		case ord("Q"): return "Q";			  break;
		case ord("R"): return "R";			  break;
		case ord("S"): return "S";			  break;
		case ord("T"): return "T";			  break;
		case ord("U"): return "U"; 			  break;
		case ord("V"): return "V"; 			  break;
		case ord("W"): return "W";			  break;
		case ord("X"): return "X";			  break;
		case ord("Y"): return "Y";			  break;
		case ord("Z"): return "Z";			  break;
		case vk_up:	   return "Up";			  break;
		case vk_down:  return "Down";		  break;
		case vk_left:  return "Left";		  break;
		case vk_right: return "Right";		  break;
		case vk_enter: return "Enter";		  break;
		case vk_lshift: return "Left Shift";  break;
		case vk_rshift: return "Right Shift"; break;
		case vk_escape: return "Escape";	  break;
		
		case gp.lu:        return "Left Stick Up";    break;
		case gp.ld:        return "Left Stick Down";  break;
		case gp.ll:        return "Left Stick Left";  break;
		case gp.lr:        return "Left Stick Right"; break;
		case gp_padu:      return "D-Pad Up";		  break;
		case gp_padd:      return "D-Pad Down";	      break;
		case gp_padl:      return "D-Pad Left";	      break;
		case gp_padr:      return "D-Pad Right";	  break;
		case gp_face1:     return "Pad A";			  break;
		case gp_face2:     return "Pad B";			  break;
		case gp_face3:     return "Pad X";		      break;
		case gp_face4:     return "Pad Y";		      break;
		case gp_start:     return "Pad Start";	      break;
		case gp_select:    return "Pad Select";	      break;
		case gp_shoulderl: return "Left Shoulder";    break;
		case gp_shoulderr: return "Right Shoulder";   break;
	}
}