/// @description Draw Button Debug
if(drawInputDebug){
	//Draws display for stick direction holding and releasing
	for(i=0;i<8;i++){
		draw_rectangle(i*16,0,i*16+16,16,1);
		if(sticks[i,0]) draw_rectangle(i*16,0,i*16+16,16,0);
		if(sticks[i,1] || sticks[i,2]) draw_rectangle(i*16,16,i*16+16,32,0);
	}
}