//Initialize key variables for this code
//center_x = view_wport[0] / 2;
//title_y = view_hport[0] / 2 - 200;

/// @function menu_down(list);
/// @param {list} The list of entries in that menu
function menu_down(list){
	if(cursor_opt < array_length(list) - 1){
		cursor_opt++;
	}else{
		cursor_opt = 0;
	}
}


/// @function menu_up(list);
/// @param {list} The list of entries in that menu
function menu_up(list){
	if(cursor_opt > 0){
		cursor_opt--;
	}else{
		cursor_opt = array_length(list) - 1;
	}
}

/// @function print_text_fading(x, y, color1, color2, str, sep, width, alpha)
function print_text_fading(x, y, color1, color2, str, sep, width, alpha){
		
		draw_set_font(font_stats);
		draw_text_ext_color(x + 3, y, str, sep,width,color2,color2,color2,color2,alpha);
		draw_text_ext_color(x - 2, y, str, sep,width,color2,color2,color2,color2,alpha);
		draw_text_ext_color(x, y + 3, str, sep,width,color2,color2,color2,color2,alpha);
		draw_text_ext_color(x, y - 2 , str, sep,width,color2,color2,color2,color2,alpha);
		draw_text_ext_color(x, y, str, sep,width,color1,color1,color1,color1,alpha);
		
}


/// @function print_data(x, y, color1, color2, str);
/// @param {real} x - The x position of the text
/// @param {real} y - The y poistion of the text
/// @param {color} color1 - The fill color for the text
/// @param {color} color2 - The outline color for the text
/// @param {string} str - The string to be printed
function print_data(x, y, color1, color2, str){
		
		draw_set_color(color2);
		draw_set_font(font_stats);
		draw_text(x + 3, y, str);
		draw_text(x - 2, y, str);
		draw_text(x, y + 3, str);
		draw_text(x, y - 2, str);
		draw_set_color(color1);
		draw_text(x, y, str);
		
}

function print_text_box(x, y, color1, color2, str, sep, width){
		
		draw_set_color(color2);
		draw_set_font(font_stats);
		draw_text_ext(x + 3, y, str, sep,width);
		draw_text_ext(x - 2, y, str, sep,width);
		draw_text_ext(x, y + 3, str, sep,width);
		draw_text_ext(x, y - 2 , str, sep,width);
		draw_set_color(color1);
		draw_text_ext(x, y, str, sep,width);
		
}


/// @function print_menu_battle(list, text_spacing, x_pos, y_pos, cursor_opt, color1, color2, color3);
/// @param {array} list - The list to be printed out
/// @param {real} text_spacing - The spacing between text vertically
/// @param {real} x_pos - The x position of the text (from top left)
/// @param {real} y_pos - The y position of the text
/// @param {integer} cursor_opt - The number representing the location of the cursor within a given array
/// @param {color} color1 - The color of the inside of the text
/// @param {color} color2 - The color of the outside of the non-selected text
/// @param {color} color3 - The color of the outside of the selected text
function print_menu_battle(list,text_spacing,x_pos, y_pos, cursor_opt, color1, color2, color3){
	
	//Change to draw_text-ext at some point, I'm just lazy right now
	
for(i = 0; i < array_length(list); i++){
		draw_set_font(font_menu);
		draw_set_halign(fa_left);
		
		if(i = cursor_opt){
			draw_set_color(color3);
			draw_text(view_xport[0]+x_pos+4, (view_yport[0]+y_pos) + (i*text_spacing), list[i]);
			draw_text(view_xport[0]+x_pos-4, (view_yport[0]+y_pos) + (i*text_spacing), list[i]);
			draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing)+4, list[i]);
			draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing-4), list[i]);
			draw_set_color(color1);
			draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing), list[i]);
		}else{
			draw_set_color(color2);
			draw_text(view_xport[0]+x_pos+4, (view_yport[0]+y_pos) + (i*text_spacing), list[i]);
			draw_text(view_xport[0]+x_pos-4, (view_yport[0]+y_pos) + (i*text_spacing), list[i]);
			draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing)+4, list[i]);
			draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing-4), list[i]);
			draw_set_color(color1);
			draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing), list[i]);
		}

	}
	
	draw_set_halign(fa_left);

}

/// @function print_menu_battle_varied(list, text_spacing, x_pos, y_pos, cursor_opt, color1, color2, color3);
/// @param {array} list - The list to be printed out
/// @param {real} text_spacing - The spacing between text vertically
/// @param {real} x_pos - The x position of the text (from top left)
/// @param {real} y_pos - The y position of the text
/// @param {integer} cursor_opt - The number representing the location of the cursor within a given array
/// @param {color} color1 - The color of the inside of the text
/// @param {color} color2 - The color of the outside of the non-selected text
/// @param {color} color3 - The color of the outside of the selected text
function print_menu_battle_varied(list,text_spacing,x_pos, y_pos, cursor_opt, color1, color2, color3){
	
	for(i = 0; i < array_length(list)-1; i++){
		draw_set_font(font_menu);
		draw_set_halign(fa_left);
		
		if(i = cursor_opt){
			draw_set_color(color3);
			draw_text(view_xport[0]+x_pos+4, (view_yport[0]+y_pos) + (i*text_spacing), list[i].name);
			draw_text(view_xport[0]+x_pos-4, (view_yport[0]+y_pos) + (i*text_spacing), list[i].name);
			draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing)+4, list[i].name);
			draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing-4), list[i].name);
			draw_set_color(color1);
			draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing), list[i].name);
		}else{
			draw_set_color(color2);
			draw_text(view_xport[0]+x_pos+4, (view_yport[0]+y_pos) + (i*text_spacing), list[i].name);
			draw_text(view_xport[0]+x_pos-4, (view_yport[0]+y_pos) + (i*text_spacing), list[i].name);
			draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing)+4, list[i].name);
			draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing-4), list[i].name);
			draw_set_color(color1);
			draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing), list[i].name);
		}

	}
	
	if(i = cursor_opt){
		draw_set_color(color3);
		draw_text(view_xport[0]+x_pos+4, (view_yport[0]+y_pos) + (i*text_spacing), "Back");
		draw_text(view_xport[0]+x_pos-4, (view_yport[0]+y_pos) + (i*text_spacing), "Back");
		draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing)+4, "Back");
		draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing-4), "Back");
		draw_set_color(color1);
		draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing), "Back");
	}else{
		draw_set_color(color2);
		draw_text(view_xport[0]+x_pos+4, (view_yport[0]+y_pos) + (i*text_spacing), "Back");
		draw_text(view_xport[0]+x_pos-4, (view_yport[0]+y_pos) + (i*text_spacing), "Back");
		draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing)+4, "Back");
		draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing-4), "Back");
		draw_set_color(color1);
		draw_text(view_xport[0]+x_pos, (view_yport[0]+y_pos) + (i*text_spacing), "Back");
	}
	
	draw_set_halign(fa_left);

}