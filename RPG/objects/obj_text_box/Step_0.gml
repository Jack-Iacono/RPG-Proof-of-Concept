/// @description Decides when to show or not show text box sprite

if(text = ""){
	sprite_index = spr_clear;
}else{
	sprite_index = spr_inspect_backdrop;
	//show_debug_message(string(string_height_ext(text,seperation,width)));
	image_yscale = (string_height_ext(text,seperation,width) + 40) / 15;
}