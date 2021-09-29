/// @function use_item_damage(item, target_array);
/// @param {item} item - the item to be used
/// @param {list} target_array the array of targets
function use_item_damage(item, target_array){
	for(k = 0; k < array_length(target_array); k++){
		text_target = target_array[k].name;
		
		switch(item){
		
			case item_rocket:
				target_array[k].hp -= item.effect_amount;
				text_effect = string(item.effect_amount);
				break;
		
		}
	}
	
	array_push(obj_turn_stats.text, text_target + " took " +  string(text_effect) + " damage");
	
}

/// @function use_item_status(item, target_array);
/// @param {item} item - the item to be used
/// @param {list} target_array the array of targets
function use_item_status(item, target_array){
	for(k = 0; k < array_length(target_array); k++){
		switch(item){
		
			case item_poison_meat:
				target_array[k].hp += item.effect_amount;
				elemental_chance_item(item.element, target_array[k]);
				break;
		
		}
	}
	
}

/// @function use_item_health(item, target_array);
/// @param {item} item - the item to be used
/// @param {list} target_array the array of targets
function use_item_health(item, target_array){
	for(k = 0; k < array_length(target_array); k++){
		text_target = target_array[k].name;
		
		switch(item){
		
			case item_bandage:
			
				for(k = 0; k < array_length(target_array); k++){
					target_array[k].hp += item.effect_amount;
					text_effect = string(item.effect_amount);
				}
			
				break;
		
		}
	}
	
	array_push(obj_turn_stats.text, text_target + " healed for " +  string(text_effect) + " health");
	
}