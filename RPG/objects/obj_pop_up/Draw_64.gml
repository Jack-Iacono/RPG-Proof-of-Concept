/// @description Draws the text

for(i = 0; i < array_length(defender_text); i++){
	print_text_fading(1000, 450 + (50 * i), c_white, c_black, defender_text[i] + status_text[i], seperation, width, text_alpha[i]);
}

if(array_length(defender_text) > 7){
	array_delete(defender_text,0,array_length(defender_text) - 7);
	array_delete(status_text,0,array_length(status_text) - 7);
	
	array_resize(defender_text, 7);
	array_resize(status_text, 7);
}
