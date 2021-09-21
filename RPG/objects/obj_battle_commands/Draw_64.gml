/// @description Draws menu layout

switch(section){
	
	case 0:
		print_menu_battle(command, text_spacing, 80, 60, cursor_opt,text_color1, text_color2, text_color3);
		text_array = command;
		break;
	case 1:
		print_menu_battle(attack, text_spacing, 80, 60, cursor_opt, text_color1, text_color2, text_color3);
		text_array = attack;
		break;
	case 2:
		print_menu_battle_varied(physical, text_spacing, 80, 60, cursor_opt, text_color1, text_color2, text_color3);
		text_array = physical;
		break;
	case 3:
		print_menu_battle_varied(magic, text_spacing, 80, 60, cursor_opt, text_color1, text_color2, text_color3);
		text_array = magic;
		break;
	case 4:
		print_menu_battle(strat, text_spacing, 80, 60, cursor_opt, text_color1, text_color2, text_color3);
		text_array = strat;
		break;
	case 5:
		print_menu_battle(item, text_spacing, 80, 60, cursor_opt, text_color1, text_color2, text_color3);
		text_array = item;
		break;
	case 6:
		print_menu_battle_varied(enemy, text_spacing, 80, 60, cursor_opt, text_color1, text_color2, text_color3);
		text_array = enemy;
		break;
	case 7:
		print_menu_battle(command, text_spacing, 80, 60, cursor_opt, c_ltgray, c_gray, c_gray);
		text_array = command;
		break;
	case 8:
		print_menu_battle_varied(enemy, text_spacing, 80, 60, cursor_opt, text_color1, text_color2, text_color3);
		text_array = enemy;
		break;
		
}

//Need this so textbox can be adjusted



