/// @description Insert description here
// You can write your code in this editor


//Sorts turn_order by speed stat
if(array_length(turn_order) >= instance_number(obj_enemy_battle) + 1 && !sorted){
	
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
	show_debug_message(string(turn_order));
	sorted = true;
}