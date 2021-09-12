/// @description Draws menu layout

switch(section){
	
	case 0:
		print_menu_battle(command, text_spacing, 80, 60, cursor_opt,text_color1, text_color2, text_color3);
		break;
	case 1:
		print_menu_battle(attack, text_spacing, 80, 60, cursor_opt, text_color1, text_color2, text_color3);
		break;
	case 2:
		print_menu_battle_varied(physical, text_spacing, 80, 60, cursor_opt, text_color1, text_color2, text_color3);
		break;
	case 3:
		print_menu_battle_varied(magic, text_spacing, 80, 60, cursor_opt, text_color1, text_color2, text_color3);
		break;
	case 4:
		print_menu_battle(strat, text_spacing, 80, 60, cursor_opt, text_color1, text_color2, text_color3);
		break;
	case 5:
		print_menu_battle(item, text_spacing, 80, 60, cursor_opt, text_color1, text_color2, text_color3);
		break;
	case 6:
		print_menu_battle_varied(enemy, text_spacing, 80, 60, cursor_opt, text_color1, text_color2, text_color3);
		break;
	case 7:
		print_menu_battle(command, text_spacing, 80, 60, cursor_opt, c_ltgray, c_gray, c_gray);
		break;
	case 8:
		print_menu_battle_varied(enemy, text_spacing, 80, 60, cursor_opt, text_color1, text_color2, text_color3);
		break;
		
}

//print_data(200,200,c_white,c_black,string(obj_enemy_battle.turn_array[0]));
