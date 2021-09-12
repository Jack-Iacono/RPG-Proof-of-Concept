/// @description Draws out the given text

draw_set_halign(fa_left);
print_text_box(40, room_height - string_height_ext(text,seperation,width) - 40, c_white, c_black, text, seperation, width);
draw_set_halign(fa_left);