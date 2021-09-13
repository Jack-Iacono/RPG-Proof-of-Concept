/// @function elemental_chance(element, target)
/// @param {obj_element} element - The element which is to be tested for hit
/// @param {obj_target} target - The target which is to be inflicted with the status
function elemental_chance(element, target){
	
	refresh_index = -1;
	
	if(target == obj_player_battle){
		//Gives player a lower chance of getting a status when multiple enemies are present
		if(random(100) < element.chance / (instance_number(obj_enemy_battle) * 1.66)){
			
			for(j = 0; j < array_length(target.status_array); j++){
				if(target.status_array[j].name = element.name){
					refresh_index = j;
				}
			}
			
			if(refresh_index != -1){
				target.turn_array[refresh_index] = element.duration;
				
			}else{
				array_push(obj_pop_up.status_text, " got " + element.name);
				array_push(obj_pop_up.defender_text, target.name);
				array_push(obj_pop_up.text_alpha, 1);
				array_push(target.status_array, element);
				array_push(target.turn_array, element.duration);
				
			}
			
		}
	}else{
			if(random(100) < element.chance){
			
			for(j = 0; j < array_length(target.status_array); j++){
				if(target.status_array[j].name = element.name){
					refresh_index = j;
				}
			}
			
			if(refresh_index != -1){
				target.turn_array[refresh_index] = element.duration;
				
			}else{
				array_push(obj_pop_up.status_text, " got " + element.name);
				array_push(obj_pop_up.defender_text, target.name);
				array_push(obj_pop_up.text_alpha, 1);
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
			
			for(j = 0; j < array_length(target.status_array); j++){
				if(target.status_array[j].name = element.name){
					refresh_index = j;
				}
			}
			
			if(refresh_index != -1){
				target.turn_array[refresh_index] = element.duration;
				
			}else{
				array_push(obj_pop_up.status_text, " got " + element.name);
				array_push(obj_pop_up.defender_text, target.name);
				array_push(obj_pop_up.text_alpha, 1);
				array_push(target.status_array, element);
				array_push(target.turn_array, element.duration);
				
			}
			
		}
	}else{
			if(random(100) < element.chance * 2){
			
			for(j = 0; j < array_length(target.status_array); j++){
				if(target.status_array[j].name = element.name){
					refresh_index = j;
				}
			}
			
			if(refresh_index != -1){
				target.turn_array[refresh_index] = element.duration;
				
			}else{
				array_push(obj_pop_up.status_text, " got " + element.name);
				array_push(obj_pop_up.defender_text, target.name);
				array_push(obj_pop_up.text_alpha, 1);
				array_push(target.status_array, element);
				array_push(target.turn_array, element.duration);
				
			}
			
		}
	}
}


/// @function elemental_effect(element, target)
/// @param {obj_element} element - The element which is cause it's effect
/// @param {obj_target} target - The target which is to be inflicted with the status
function elemental_effect(element, target){
	
	switch(element){
		
		case element_none:
			//does the element's damage as a percent of total health
			target.hp -= (target.hp / 100) * element.element_damage;
			show_debug_message(target.name + " took " + string((target.hp / 100) * element.element_damage) + " Bleed Damage");
			break;
		
		case element_flame:
			target.hp -= element.element_damage;
			show_debug_message(target.name + " took " + string(element.element_damage) + " Flame Damage");
			break;
		
		case element_poison:
			//Could use this for other elements
			for(j = 0; j < array_length(target.status_array); j++){
				if(element == target.status_array[j]){
					status_index = j;
				}
			}
			
			//multiplies damage over time
			target.hp -= element.element_damage * (element.duration - target.turn_array[status_index]);
			show_debug_message(target.name + " took " + string(element.element_damage * (element.duration - target.turn_array[status_index])) + " Poison Damage");
			break;
		
	}

}