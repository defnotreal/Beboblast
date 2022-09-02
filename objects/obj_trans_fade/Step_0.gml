/// @description Fade

alpha += fade_spd;

if (alpha >= 1)
{
	on_half();
	alpha = 1;
	fade_spd *= -1;
}
else if (alpha < 0) instance_destroy(self);