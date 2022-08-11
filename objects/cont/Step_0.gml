/// @description Check inputs

//Returns the highest priority slot with gamepad
gps = scr_gp_s();

//Checks inputs for sticks
//Left stick left
var thisframe = gamepad_axis_value(gps,gp_axislh) <= -stickthresh;
sticks[0,bState.pressed] = (!sticks[0,bState.held] && thisframe);
sticks[0,bState.released] = (sticks[0,bState.held] && !thisframe);
sticks[0,bState.held] = thisframe;
//Left stick right
thisframe = gamepad_axis_value(gps,gp_axislh) >= stickthresh;
sticks[1,bState.pressed] = (!sticks[1,bState.held] && thisframe);
sticks[1,bState.released] = (sticks[1,bState.held] && !thisframe);
sticks[1,bState.held] = thisframe;
//Left stick up
thisframe = gamepad_axis_value(gps,gp_axislv) <= -stickthresh;
sticks[2,bState.pressed] = (!sticks[2,bState.held] && thisframe);
sticks[2,bState.released] = (sticks[2,bState.held] && !thisframe);
sticks[2,bState.held] = thisframe;
//Left stick down
thisframe = gamepad_axis_value(gps,gp_axislv) >= stickthresh;
sticks[3,bState.pressed] = (!sticks[3,bState.held] && thisframe);
sticks[3,bState.released] = (sticks[3,bState.held] && !thisframe);
sticks[3,bState.held] = thisframe;
//Right stick left
thisframe = gamepad_axis_value(gps,gp_axisrh) <= -stickthresh;
sticks[4,bState.pressed] = (!sticks[4,bState.held] && thisframe);
sticks[4,bState.released] = (sticks[4,bState.held] && !thisframe);
sticks[4,bState.held] = thisframe;
//Right stick right
thisframe = gamepad_axis_value(gps,gp_axisrh) >= stickthresh;
sticks[5,bState.pressed] = (!sticks[5,bState.held] && thisframe);
sticks[5,bState.released] = (sticks[5,bState.held] && !thisframe);
sticks[5,bState.held] = thisframe;
//Right stick up
thisframe = gamepad_axis_value(gps,gp_axisrv) <= -stickthresh;
sticks[6,bState.pressed] = (!sticks[6,bState.held] && thisframe);
sticks[6,bState.released] = (sticks[6,bState.held] && !thisframe);
sticks[6,bState.held] = thisframe;
//Right stick down
thisframe = gamepad_axis_value(gps,gp_axisrv) >= stickthresh;
sticks[7,bState.pressed] = (!sticks[7,bState.held] && thisframe);
sticks[7,bState.released] = (sticks[7,bState.held] && !thisframe);
sticks[7,bState.held] = thisframe;