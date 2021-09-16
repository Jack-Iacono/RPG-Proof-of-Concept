/// @description Selects Menu Option
switch(section){
	
	case 0:
		//Basic first menu that you see
		switch(cursor_opt){

			case 0:
				section = 1;
				break;
			case 1:
				section = 4;
				break;
			case 2:
				section = 5;
				break;
			case 3:
				//Change out for run away later
				game_end();
				break;
		}
		break;
		
	case 1:
		//Decides what type of attack will be used Magical or Physical
		switch(cursor_opt){
			
			case 0:
				section = 2;
				attack_type = obj_attack_physical;
				break;
			case 1:
				section = 3;
				attack_type = obj_attack_magical;
				break;
			case 2:
				section = 0;
				break;
			
		}
		break;
	
	case 2:
		//Decides which physical attack you will use
		if(cursor_opt < array_length(physical) - 1){
			
			attack_object = physical[cursor_opt];
			
			//Decides how many Enemies can be targetted
			selections = attack_object.targets;
			array_delete(target_array, 0, array_length(target_array));
			
			section = 6;
			
		}else if(cursor_opt = array_length(physical) - 1){
			section = 1;
		}
		break;
		
	case 3:
		//Decides whihc magical attack you will use
		if(cursor_opt < array_length(magic) - 1){
			
			attack_object = magic[cursor_opt];
			
			//Decides how many Enemies can be targetted
			selections = attack_object.targets;
			array_delete(target_array, 0, array_length(target_array));
			
			section = 6;
		}else if(cursor_opt = array_length(magic) - 1){
			section = 1;
		}
		break;
	
	case 4:
		//options for strategy
		switch(cursor_opt){
		
			case 0:
				//Enhance Attack Options
				
				section = 8;
				break;
			case 1:
				//Inspect Options
				
				section = 8;
				break;
			case 2:
				section = 0;
				break;
		
		}
	
	case 5:
	//Item list !! To be implemented !!
		if(cursor_opt = array_length(item) - 1 && section = 5){
			section = 0;
		}
		break;
	
	case 6:
		
		//Carries out attack based on targetting
		if(cursor_opt < array_length(enemy) - 1){
			
			if(selections <= 2){
			
				array_push(target_array,enemy[cursor_opt]);
				
			}else if(selections == 3){
				
				for(i = 0; i < array_length(enemy) - 1; i++){
					target_array[i] = enemy[i];	
				}
				
			}
			
			if(array_length(target_array) >= selections){
				
				if(attack_type == obj_attack_physical){
					
					array_push(obj_battle_controller.cmd_selection, 0);
					array_push(obj_battle_controller.turn_order, self.id);
					array_push(obj_battle_controller.attack_object, attack_object);
					array_push(obj_battle_controller.player_target_array, target_array);
					show_debug_message("Pushed Player Information");
				
				}else if(attack_type == obj_attack_magical){
					
					array_push(obj_battle_controller.cmd_selection, 1);
					array_push(obj_battle_controller.turn_order, self.id);
					array_push(obj_battle_controller.attack_object, attack_object);
					array_push(obj_battle_controller.player_target_array, target_array);
					
				}
				
				array_delete(target_array, 0, array_length(target_array));
				end_turn();
				section = 7;
			}
		
		}else if(cursor_opt = array_length(enemy) - 1 && section = 6){
			section = 1;
		}
		
		break;
		
	case 8:
		if(cursor_opt < array_length(enemy) - 1){
			
			array_push(obj_battle_controller.cmd_selection, 2);
			array_push(obj_battle_controller.turn_order, self.id);
			array_push(obj_battle_controller.player_target_array, enemy[cursor_opt]);
			
			end_turn();
			section = 7;
		
		}else if(cursor_opt = array_length(enemy) - 1 && section = 8){
			section = 4;
		}
		
		break;
}

cursor_opt = 0;

/*Section Number List
0: command
1: Attack
	2: Physical Menu
	3: Magic Menu
4: Strategy
5: Item Menu
6: Target Confirm - Attacks
7: Gray Screen
8: Target Confirm Strategy
*/

