fade_alpha  = 1;
part	    = 0;
credit_move = game_get_speed(gamespeed_fps) * 1;

credit_text[0] = "Beboblast Team";
credit_text[1] = "Cactus Companion\nProject Lead, Original Concept, Spritework";
credit_text[2] = "defnotreal_\nProgramming Lead, Sprite Cleanup";
credit_text[3] = "illdie\nAdditional programming";
credit_text[4] = "Beta PaRappa\nSpritework, Cutscene art";
credit_text[5] = "Randtastik\nTrashtalker Enemy Design"
credit_text[6] = "ToasterPower777\nMusic Composition";
credit_text[7] = "Sound effects taken from:\nANTONBLAST";

credit_sel	   = 0;
text_out	   = "";
text_pos	   = 0;
text_delay	   = 1;
text_writing   = true;
mus_vol		   = audio_emitter_get_gain(global.a_music);

function advance_credits()
{
	credit_move = game_get_speed(gamespeed_fps) * 3;
	if (credit_sel == array_length(credit_text) - 1) fade(function() {
														credit_move = game_get_speed(gamespeed_fps) * 8;
														part++;
													 }, 0.01);
	else
	{
		credit_sel++;
		text_pos	 = 0;
		text_out	 = "";
		text_writing = true;
	}
}

#region Layer stuff

sun		   = layer_background_get_id("Sun");
clouds	   = layer_background_get_id("Clouds");
buildback  = layer_background_get_id("BuildingsBack");
buildfront = layer_background_get_id("BuildingsFront");
bebo	   = layer_background_get_id("Bebo");
ground	   = layer_background_get_id("Ground");

layer_background_xscale(sun, 1.5);
layer_background_yscale(sun, 1.5);

layer_background_xscale(clouds, 1.5);
layer_background_yscale(clouds, 1.5);

layer_background_xscale(buildback, 1.5);
layer_background_yscale(buildback, 1.5);

layer_background_xscale(buildfront, 1.5);
layer_background_yscale(buildfront, 1.5);

layer_background_xscale(bebo, 1.5);
layer_background_yscale(bebo, 1.5);

layer_background_xscale(ground, 1.5);
layer_background_yscale(ground, 1.5);

#endregion

