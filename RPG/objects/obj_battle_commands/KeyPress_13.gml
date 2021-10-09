/// @description Selects Menu Option
switch(section){
	
	case 0:
		//Basic first menu that you see
		switch(cursor_opt){

			case 0:
				section = 1;
				break;
			case 1:
				section = 8;
				break;
			case 2:
				section = 5;
				break;
			case 3:
				//Change out for run away later, need to delete controllers
				obj_battle_controller.pass_info = true;
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
	
	case 5:
	//Item list !! To be implemented !!
	
		if(cursor_opt < array_length(item) - 1){
			if(object_get_parent(item[cursor_opt]) = obj_item_heal){
				
				use_item = item[cursor_opt];
				
				array_push(obj_battle_controller.cmd_selection, 3);
				array_push(obj_battle_controller.turn_order, obj_player_battle);
				array_push(obj_battle_controller.player_target_array, obj_player_battle);
				array_push(obj_battle_controller.attack_object, obj_attack_physical);
				obj_battle_controller.player_item = use_item;
				
				end_turn();
				section = 7;
				
			}else{
				use_item = item[cursor_opt];
				selections = use_item.targets;
				array_delete(target_array, 0, array_length(target_array));
				//show_debug_message("Selections: " + string(selections));
				section = 9;
			}
		}else if(cursor_opt = array_length(item) - 1 && section = 5){
			section = 0;
		}
		break;
	
	case 6:
		
		//Carries out attack based on targetting
		if(selections = 3){
			
			if(cursor_opt < array_length(all_attack) - 1){
				
				for(i = 0; i < array_length(enemy) - 1; i++){
					target_array[i] = enemy[i];	
					instance_create_layer(enemy[i].x,enemy[i].y - (enemy[i].sprite_height / 4),"Displays",obj_target_marker);
				}
				
				if(attack_type == obj_attack_physical){
					
						array_push(obj_battle_controller.cmd_selection, 0);
						array_push(obj_battle_controller.turn_order, obj_player_battle);
						array_push(obj_battle_controller.attack_object, attack_object);
					
						for(i = 0; i < array_length(target_array); i++){
							obj_battle_controller.player_target_array[i] = target_array[i];
						}
					
						//show_debug_message("Pushed Player Information");
				
					}else if(attack_type == obj_attack_magical){
					
						array_push(obj_battle_controller.cmd_selection, 1);
						array_push(obj_battle_controller.turn_order, obj_player_battle);
						array_push(obj_battle_controller.attack_object, attack_object);
					
						for(i = 0; i < array_length(target_array); i++){
							obj_battle_controller.player_target_array[i] = target_array[i];
						}
					
						//show_debug_message("Pushed Player Information");
					
					}
				
					array_delete(target_array, 0, array_length(target_array));
					end_turn();
				
			}else if(cursor_opt = array_length(all_attack) - 1 && section = 6){
				delete_target_markers();
				section = 1;
			}
			
		}else{
			if(cursor_opt < array_length(enemy) - 1){
			
				array_push(target_array,enemy[cursor_opt]);
				instance_create_layer(enemy[cursor_opt].x,enemy[cursor_opt].y - (enemy[cursor_opt].sprite_height / 4),"Displays",obj_target_marker);
			
				if(array_length(target_array) >= selections){
				
					if(attack_type == obj_attack_physical){
					
						array_push(obj_battle_controller.cmd_selection, 0);
						array_push(obj_battle_controller.turn_order, obj_player_battle);
						array_push(obj_battle_controller.attack_object, attack_object);
					
						for(i = 0; i < array_length(target_array); i++){
							obj_battle_controller.player_target_array[i] = target_array[i];
						}
					
						//show_debug_message("Pushed Player Information");
				
					}else if(attack_type == obj_attack_magical){
					
						array_push(obj_battle_controller.cmd_selection, 1);
						array_push(obj_battle_controller.turn_order, obj_player_battle);
						array_push(obj_battle_controller.attack_object, attack_object);
					
						for(i = 0; i < array_length(target_array); i++){
							obj_battle_controller.player_target_array[i] = target_array[i];
						}
					
						//show_debug_message("Pushed Player Information");
					
					}
				
					array_delete(target_array, 0, array_length(target_array));
					end_turn();
					section = 7;
				}
		
			}else if(cursor_opt = array_length(enemy) - 1 && section = 6){
				delete_target_markers();
				section = 1;
			}
		}
		
		
		break;
		
	case 7:
		delete_inspect_markers();
		delete_target_markers();
		section = 0;
		break;
		
	case 8:
		if(cursor_opt < array_length(enemy) - 1){
			
			array_push(obj_battle_controller.cmd_selection, 2);
			array_push(obj_battle_controller.turn_order, obj_player_battle);
			array_push(obj_battle_controller.attack_object, obj_attack_physical);
			array_push(obj_battle_controller.player_target_array, enemy[cursor_opt]);
			
			instance_create_layer(enemy[cursor_opt].x,enemy[cursor_opt].y - (enemy[cursor_opt].sprite_height / 6),"Displays",obj_inspect_marker);
			
			end_turn();
			section = 7;
		
		}else if(cursor_opt = array_length(enemy) - 1 && section = 8){
			section = 0;
			delete_inspect_markers();
		}
		
		break;
		
	case 9:
	
		if(cursor_opt < array_length(enemy) - 1){
			
			array_push(target_array,enemy[cursor_opt]);
			instance_create_layer(enemy[cursor_opt].x,enemy[cursor_opt].y - (enemy[cursor_opt].sprite_height / 6),"Displays",obj_target_marker);
			
			
			if(array_length(target_array) >= selections){
				
				array_push(obj_battle_controller.cmd_selection, 3);
				array_push(obj_battle_controller.turn_order, obj_player_battle);
				array_push(obj_battle_controller.player_target_array, enemy[cursor_opt]);
				array_push(obj_battle_controller.attack_object, obj_attack_physical);
				obj_battle_controller.player_item = use_item;
			
				for(i = 0; i < array_length(target_array); i++){
					obj_battle_controller.player_target_array[i] = target_array[i];
				}
					
				array_delete(target_array, 0, array_length(target_array));
				end_turn();
				section = 7;
			}
		
		}else if(cursor_opt = array_length(enemy) - 1 && section = 9){
			delete_target_markers();
			section = 5;
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

