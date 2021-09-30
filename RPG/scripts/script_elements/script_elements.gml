/// @function elemental_chance(element, target)
/// @param {obj_element} element - The element which is to be tested for hit
/// @param {obj_target} target - The target which is to be inflicted with the status
function elemental_chance(element, target){
	
	refresh_index = -1;
	
	if(target == obj_player_battle){
		//Gives player a lower chance of getting a status when multiple enemies are present
		if(random(100) < element.chance / (instance_number(obj_enemy_battle) * 1.66)){
			
			for(counter = 0; counter < array_length(target.status_array); counter++){
				if(target.status_array[counter].name = element.name){
					refresh_index = counter;
				}
			}
			
			if(refresh_index != -1){
				target.turn_array[refresh_index] = element.duration;
				
			}else{
				array_push(obj_turn_stats.text,target.name + " got " + element.name);
				array_push(target.status_array, element);
				array_push(target.turn_array, element.duration);
				
			}
			
		}
	}else{
			if(random(100) < element.chance){
			
			for(counter = 0; counter < array_length(target.status_array); counter++){
				if(target.status_array[counter].name = element.name){
					refresh_index = counter;
				}
			}
			
			if(refresh_index != -1){
				target.turn_array[refresh_index] = element.duration;
				
			}else{
				array_push(obj_turn_stats.text,target.name + " got " + element.name);
				array_push(target.status_array, element);
				array_push(target.turn_array, element.duration);
				
			}
			
		}
	}
}

function elemental_chance_magic(element, target){
	
	refresh_index = -1;
	
	if(target == obj_player_battle){
		//Gives player a lower chance of getting a status when multiple enemies are present
		if(random(100) < element.chance / (instance_number(obj_enemy_battle) * 0.88)){
			
			for(counter = 0; counter < array_length(target.status_array); counter++){
				if(target.status_array[counter].name = element.name){
					refresh_index = counter;
				}
			}
			
			if(refresh_index != -1){
				target.turn_array[refresh_index] = element.duration;
				
			}else{
				array_push(obj_turn_stats.text, target.name + " got " + element.name);
				array_push(target.status_array, element);
				array_push(target.turn_array, element.duration);
				
			}
			
		}
	}else{
			if(random(100) < element.chance * 2){
			
			for(counter = 0; counter < array_length(target.status_array); counter++){
				if(target.status_array[counter].name = element.name){
					refresh_index = counter;
				}
			}
			
			if(refresh_index != -1){
				target.turn_array[refresh_index] = element.duration;
				
			}else{
				array_push(obj_turn_stats.text, target.name + " got " + element.name);
				array_push(target.status_array, element);
				array_push(target.turn_array, element.duration);
				
			}
			
		}
	}
}

/// @function elemental_chance_item(element, target)
/// @param {obj_element} element - The element which is to be tested for hit
/// @param {obj_target} target - The target which is to be inflicted with the status
function elemental_chance_item(element, target){
	
	refresh_index = -1;
	item_effect_chance = element.chance * 2.5;
	
	if(random(100) < item_effect_chance){
			
		for(counter = 0; counter < array_length(target.status_array); counter++){
			if(target.status_array[counter].name = element.name){
				refresh_index = counter;
			}
		}
			
		if(refresh_index != -1){
			target.turn_array[refresh_index] = element.duration;
				
		}else{
			array_push(obj_turn_stats.text,target.name + " got " + element.name);
			array_push(target.status_array, element);
			array_push(target.turn_array, element.duration);
				
		}
	}
}


/// @function elemental_effect(element, target)
/// @param {obj_element} element - The element which is cause it's effect
/// @param {obj_target} target - The target which is to be inflicted with the status
function elemental_effect(element, target){
	
	//initializes text variables
	text_target = target.name
	text_effect = "";
	
	switch(element){
		
		case element_none:
			//does the element's damage as a percent of total health
			target.hp -= (target.hp / 100) * element.element_damage;
			//show_debug_message(target.name + " took " + string((target.hp / 100) * element.element_damage) + " Bleed Damage");
			text_effect = string((target.hp / 100) * element.element_damage) + " " + element.name;
			break;
		
		case element_flame:
			target.hp -= element.element_damage;
			text_effect = string(element.element_damage) + " " + element.name;
			break;
		
		case element_poison:
			//Could use this for other elements
			for(counter = 0; counter < array_length(target.status_array); counter++){
				if(element == target.status_array[counter]){
					status_index = counter;
				}
			}
			
			//multiplies damage over time
			target.hp -= element.element_damage * (element.duration - target.turn_array[status_index] + 1);
			text_effect = string(element.element_damage * (element.duration - target.turn_array[status_index] + 1)) + " " + element.name;
			break;
		
	}

	array_push(obj_turn_stats.text, text_target + " took " +  string(text_effect) + " damage");

}