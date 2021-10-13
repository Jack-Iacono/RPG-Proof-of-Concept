/// @description Commences Fight

//Controls the whole battle
if(room = room_battle){

	if(instance_number(obj_enemy_battle) = 0){
		//Transition out of battle, put here
		pass_info = true;
		obj_pass_controller.run = false;
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
						switch(object_get_parent(player_item)){
						
							case obj_item_damage:
								use_item_damage(player_item, player_target_array,obj_player_battle);
								break;
						
							case obj_item_status:
								use_item_status(player_item, player_target_array,obj_player_battle);
								break;
						
							case obj_item_heal:
								use_item_health(player_item, player_target_array,obj_player_battle);
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
					
					case 2:
						switch(object_get_parent(enemy_items[0])){
						
							case obj_item_damage:
								use_item_damage(enemy_items[0], obj_player_battle, turn_order[j]);
								break;
							
							case obj_item_heal:
								use_item_health(enemy_items[0], obj_player_battle, turn_order[j]);
								break;
							
							case obj_item_status:
								use_item_status(enemy_items[0], obj_player_battle, turn_order[j]);
								break;
					
						}
				}
		
			}
		}
	
		start_fight = false;
		start_effects = true;
		obj_battle_commands.section = 7;
	
		array_delete(cmd_selection,0,array_length(cmd_selection));
		array_delete(turn_order,0,array_length(turn_order));
		array_delete(player_target_array,0,array_length(player_target_array));
		array_delete(attack_object,0,array_length(attack_object));
		array_delete(enemy_items,0,array_length(enemy_items));
	
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
		
	if(pass_info){
		
		instance_destroy(obj_location_controller);
		instance_destroy(obj_general_display);
		instance_destroy(obj_text_box);
		instance_destroy(obj_turn_stats);
		
		obj_pass_controller.player_hp = obj_player_battle.hp;
		obj_pass_controller.player_max_hp = obj_player_battle.max_hp;
		obj_pass_controller.player_ee = obj_player_battle.elemental_energy;
		
		with(obj_pass_controller){
			array_clear(player_items,self.id);
		}
		
		//Passes the current items to the pass controller
		//Need "- 1" so that it doesn't pass "Back" at the end of the options
		for(i = 0; i < array_length(obj_player_battle.item) - 1; i++){
			obj_pass_controller.player_items[i] = obj_player_battle.item[i];
			show_debug_message("Passed: " + obj_player_battle.item[i].name);
		}
		
		array_clear(items_spawn_enemy,self.id);
		array_clear(items_spawn_player,self.id);
		array_clear(attacks_spawn, self.id);
		array_clear(actors_spawn,self.id);
		
		actors_spawn[0] = obj_player_battle;
		
		obj_pass_controller.set_player_values = true;
		pass_info = false;
		
		obj_pass_controller.battle_over = true;
		
		room_goto(obj_pass_controller.return_room);
	}
}


