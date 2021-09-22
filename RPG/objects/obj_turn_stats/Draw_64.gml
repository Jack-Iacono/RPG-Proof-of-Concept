/// @description Draws the text

for(i = 0; i < array_length(text); i++){
	draw_set_font(font_pop_up);
	draw_set_color(c_black);
	draw_text_ext(x + 12, y + 12  + (24 * i), text[i], seperation, width);
}


if(array_length(text) > max_length){
	array_delete(text,0,array_length(text) - max_length);
}

image_yscale = total_list_height(text, seperation) / 50;