/// @description Draws menu layout

switch(section){
	
	case 0:
		print_menu_battle(command, text_spacing, text_x, text_y, cursor_opt,text_color1, text_color2, text_color3);
		text_array = command;
		break;
	case 1:
		print_menu_battle(attack, text_spacing, text_x, text_y, cursor_opt, text_color1, text_color2, text_color3);
		text_array = attack;
		break;
	case 2:
		print_menu_battle_varied_attacks(physical, text_spacing, text_x, text_y, cursor_opt, text_color1, text_color2, text_color3);
		text_array = physical;
		break;
	case 3:
		print_menu_battle_varied_attacks(magic, text_spacing, text_x, text_y, cursor_opt, text_color1, text_color2, text_color3);
		text_array = magic;
		break;
	case 5:
		//print_menu_battle_varied_elements(item, text_spacing, text_x, text_y, cursor_opt, text_color1, text_color2, text_color3);
		print_menu_battle_varied_elements(item, text_spacing, text_x, text_y, cursor_opt, text_color1, text_color2, text_color3);
		text_array = item;
		break;
	case 6:
		if(selections = 3){
			print_menu_battle(all_attack, text_spacing, text_x, text_y, cursor_opt, text_color1, text_color2, text_color3);
			if(enemy[cursor_opt] != "Back"){
				for(i = 0; i < array_length(enemy) - 1; i++){
					draw_sprite(spr_target_marker,35,enemy[i].x,enemy[i].y - (enemy[i].sprite_height / 4));
				}
			}
		}else{
			print_menu_battle_varied_elements(enemy, text_spacing, text_x, text_y, cursor_opt, text_color1, text_color2, text_color3);
			if(enemy[cursor_opt] != "Back"){
				draw_sprite(spr_target_marker,35,enemy[cursor_opt].x,enemy[cursor_opt].y - (enemy[cursor_opt].sprite_height / 4));
			}
			text_array = enemy;
		}
		break;
	case 7:
		print_menu_battle(cont, text_spacing, text_x, text_y, cursor_opt, c_ltgray, c_gray, c_gray);
		text_array = cont;
		break;
	case 8:
		print_menu_battle_varied_elements(enemy, text_spacing, text_x, text_y, cursor_opt, text_color1, text_color2, text_color3);
		if(enemy[cursor_opt] != "Back"){
				draw_sprite(spr_inspect_marker,1,enemy[cursor_opt].x,enemy[cursor_opt].y - (enemy[cursor_opt].sprite_height / 6));
		}
		text_array = enemy;
		break;
	case 9:
		print_menu_battle_varied_elements(enemy, text_spacing, text_x, text_y, cursor_opt, text_color1, text_color2, text_color3);
		if(enemy[cursor_opt] != "Back"){
				draw_sprite(spr_target_marker,35,enemy[cursor_opt].x,enemy[cursor_opt].y - (enemy[cursor_opt].sprite_height / 6));
		}
		text_array = enemy;
		break;
		
}

//Need this so textbox can be adjusted
//Idk what text_array is anymore
//Hey Jack, come here often?
//More often than I'd like to admit
//Text array adjusts textbox size, it's important


