/// @description Commences Fight


//Sorts turn_order by speed stat
if(array_length(turn_order) = instance_number(obj_enemy_battle)){
	
	//Inserts player into array
	array_push(turn_order, obj_player_battle);
	
	for(i = 0; i < array_length(turn_order); i++){
		for(j = 0; j < array_length(turn_order); j++){
			if(turn_order[i].spd < turn_order[j].spd){
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
}

//Starts fight when signaled to
if(start_fight){
	
	for(i = 0; i < array_length(turn_order); i++){
		
		if(turn_order[i] = obj_player_battle && turn_order[i].hp > 0){
		
			switch(cmd_selection){
			
				case 0:
					attack_physical(turn_order[i], attack_object[i], player_target_array);
					break;
			
				case 1:
					attack_magical(turn_order[i], attack_object[i], player_target_array);
					break;
			
				case 2:
					instance_create_layer(x,y,"Instances",obj_text_box);
					obj_text_box.text = player_target_array.desc;
					break;
			}
		
		}else if(turn_order[0] = obj_enemy_battle && turn_order[i].hp > 0){
		
			switch(cmd_selection){
			
				case 0:
					attack_physical(turn_order[i], attack_object[i], player_target_array);
					break;
			
				case 1:
					attack_magical(turn_order[i], attack_object[i], player_target_array);
					break;
			
				case 2:
					instance_create_layer(x,y,"Instances",obj_text_box);
					obj_text_box.text = player_target_array.desc;
					break;
			}
		
		}
		show_debug_message("Ran Through For Loop");
	}
	
	start_fight = false;
	obj_battle_commands.section = 0;
	
	array_delete(cmd_selection,0,array_length(cmd_selection));
	array_delete(turn_order,0,array_length(turn_order));
	array_delete(player_target_array,0,array_length(player_target_array));
	array_delete(attack_object,0,array_length(attack_object));
	
}

/*cmd_selection list
0: Physical Attack
1:Magical Attack
2:Inspect
3:Enhance
4:Item
*/