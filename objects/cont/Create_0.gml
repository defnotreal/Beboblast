/// @description Instructions/Hold input data
// Instructions at bottom

//Readable button names
keyboard_define();

//Gamepad sticks
enum gp{
	//Stick values are set to 1000+ to ensure a lack of conflicts
	ll = 1000,
	lr = 1001,
	lu = 1002,
	ld = 1003,
	rl = 1004,
	rr = 1005,
	ru = 1006,
	rd = 1007,
	length = 1008
}
globalvar stickthresh; //Threshold for digital stick input
stickthresh = 0.6;
globalvar gps; //Number of connected gamepads
gps = 0;

//Stick Input array
enum bState{
	held = 0,
	pressed = 1,
	released = 2
}
for(i=0;i<8;i++){
	sticks[i,bState.held] = false; // held
	sticks[i,bState.pressed] = false; // pressed
	sticks[i,bState.released] = false; // released
}

bt = ds_map_create();

//Debug
drawInputDebug = false; //Plug this into debug screens to 


/*
Below are all instructions for using these scripts. They're probably not very clear, sorry.

//----------------------BUTTON ASSIGNMENT-----------------------//

add_button(btnName1, btnName2, ...);
	Registers a number of string button names into the button map

button_assign_kb(button, in1, in2, ...);
	Assigns any number of keyboard mappings to the specified button string in the map
button_assign_mb(button, in1, in2, ...);
	Assigns any number of mouse mappings to the specified button string in the map
button_assign_gp(button, in1, in2, ...);
	Assigns any number of gamepad mappings to the specified button string in the map

button_clear_kb(button);
	Clears all keyboard inputs for a given button
button_clear_mb(button);
	Clears all mouse inputs for a given button
button_clear_gp(button);
	Clears all gamepad inputs for a given button

set_stick_threshold(threshold);
	Set activation threshold for gamepad sticks (0-1)

Gamepad stick indeces - Use these to assign analog sticks to buttons:
Left stick: left   right  up     down
			gp.ll, gp.lr, gp.lu, gp.ld
Right stick:left   right  up     down
			gp.rl, gp.rr, gp.ru, gp.rd


//----------------------BUTTON READING--------------------------//

get_button(btn);
	Returns whether indicated button is held down
get_button_pressed(btn);
	Returns whether indicated button is pressed
get_button_released(btn);
	Returns whether indicated button is released

//----------------------TOP LEVEL EDITING-----------------------//

controls_save(filename);
	Saves the controls as a json file with the provided filename
controls_load(filename);
	Loads the controls from a json file with the provided filename

get_button_assignment(button, type);
	Returns a list of all buttons mapped for the given input on either kb, gp, or mb in a human readable format

*/