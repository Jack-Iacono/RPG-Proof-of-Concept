/// @description Commences Fight

if(instance_number(obj_enemy_battle) = 0){
	//Transition out of battle, put here
	game_end();
}

//Sorts turn_order by speed stat
if(array_length(turn_order) = instance_number(obj_enemy_battle) + 1 && !sorted){
	
	show_debug_message("Turn, Attack, CMD: " + string(array_length(turn_order)) + ", " + string(array_length(attack_object)) + ", " + string(array_length(cmd_selection)));
	
	for(i = 0; i < array_length(turn_order); i++){
		for(j = 0; j < array_length(turn_order); j++){
			if(turn_order[i].spd > turn_order[j].spd){
				//Moves object
				temp = turn_order[i];
				turn_order[i] = turn_order[j];
				turn_order[j] = temp;
			
				//Moves associated attack_object
				temp = attack_object[i];
				attack_object[i] = attack_object[j];
				attack_object[j] = temp;
				
				//Moves associated cmd_selection
				temp = cmd_selection[i];
				cmd_selection[i] = cmd_selection[j];
				cmd_selection[j] = temp;
			}
		}
	}
	sorted = true;
}

//Starts fight when signaled to
if(start_fight){
	
	array_delete(obj_turn_stats.text, 0, array_length(obj_turn_stats.text));
	
	for(j = 0; j < array_length(turn_order); j++){
		
		//show_debug_message("Current Attacker: " + turn_order[j].name + " | Attack_object: " + attack_object[j].name +  " | CMD: " + string(cmd_selection[j]));
		
		if(turn_order[j] = obj_player_battle && turn_order[j].hp > 0){
		
			switch(cmd_selection[j]){
			
				case 0:
					attack_physical(turn_order[j], attack_object[j], player_target_array);
					break;
			
				case 1:
					attack_magical(turn_order[j], attack_object[j], player_target_array);
					break;
			
				case 2:
					obj_text_box.text = player_target_array[0].desc;
					break;
				case 3:
					show_debug_message("Inside Item Switch");
					switch(object_get_parent(player_item)){
						
						case obj_item_damage:
							use_item_damage(player_item, player_target_array,obj_battle_commands);
							break;
						
						case obj_item_status:
							use_item_status(player_item, player_target_array,obj_battle_commands);
							break;
						
						case obj_item_heal:
							use_item_health(player_item, player_target_array,obj_battle_commands);
							break;
						
					}
					break;
			}
		
		}else if(turn_order[j] != obj_enemy_battle && turn_order[j].hp > 0 && instance_exists(turn_order[j])){
		
			switch(cmd_selection[j]){
			
				case 0:
					//show_debug_message("Turn_Order: " + turn_order[j].name + " | attack_object: " + attack_object[j].name + " | Target: " + enemy_target_array[0].name);
					attack_physical(turn_order[j], attack_object[j], enemy_target_array);
					break;
			
				case 1:
					//show_debug_message("Turn_Order: " + turn_order[j].name + " | attack_object: " + attack_object[j].name + " | Target: " + enemy_target_array[0].name);
					attack_magical(turn_order[j], attack_object[j], enemy_target_array);
					break;
			}
		
		}
		//show_debug_message("Ran Through For Loop " + string(j) + " times");
	}
	
	start_fight = false;
	start_effects = true;
	obj_battle_commands.section = 7;
	
	array_delete(cmd_selection,0,array_length(cmd_selection));
	array_delete(turn_order,0,array_length(turn_order));
	array_delete(player_target_array,0,array_length(player_target_array));
	array_delete(attack_object,0,array_length(attack_object));
	
	sorted = false;
}

if(start_effects){
	//Applies status effects for enemies
	for(i = 0; i < instance_number(obj_enemy_battle); i++){
	
		with(instance_find(obj_enemy_battle, i)){
			//Need second array to avoid skipping of status charges
			if(array_length(turn_array) != 0){
				for(i = array_length(status_array) - 1; i >= 0; i--){
					if(turn_array[i] == 0){
						array_delete(status_array,i,1);	
						array_delete(turn_array,i,1);
					}
				}
			}
	
			//Applies status over turns
			for(i = 0; i < array_length(status_array); i++){
				//show_debug_message("Engage elemental effect");
				elemental_effect(status_array[i], self.id);
				turn_array[i] -= 1;
			}
			
			//show_debug_message(name + " Status Array: " + string(array_length(status_array)) + "------------------------");
			//show_debug_message(name + " Turn Array: " + string(array_length(turn_array)) + "------------------------");
		}
	}
	
	//Applies player status
	with(obj_player_battle){
		//Need second array to avoid skipping of status charges
		if(array_length(turn_array) != 0){
			for(i = array_length(status_array) - 1; i >= 0; i--){
				if(turn_array[i] == 0){
					array_delete(status_array,i,1);	
					array_delete(turn_array,i,1);
				}
			}
		}

		//Applies status over turns
		for(i = 0; i < array_length(status_array); i++){
			elemental_effect(status_array[i], self.id);
			turn_array[i] -= 1;
		}
	}
	
	
	start_effects = false;
	obj_battle_commands.section = 7;
}	



/*cmd_selection list
0: Physical Attack
1:Magical Attack
2:Inspect
3:Enhance
4:Item
*/


