//these are inseperate places to decrease confusion when adding more, trust me, it's fine

/// @function use_item_damage(item, target_array);
/// @param {item} item - the item to be used
/// @param {list} target_array the array of targets
/// @param {obj} user - The caller / user of the item
function use_item_damage(item, target_array,user){
	
	show_debug_message("User: " + user.name);
	show_debug_message("Item: " + item.name);
	array_push(obj_turn_stats.text, user.name + " used " + item.name);
	
	for(k = 0; k < array_length(target_array); k++){
		text_target = target_array[k].name;
		
		switch(item){
		
			case item_rocket:
				target_array[k].hp -= item.effect_amount;
				text_effect = string(item.effect_amount);
				break;
		
		}
		
		if(item.element != element_none){
			elemental_chance(item.element,target_array[k]);	
		}
		array_push(obj_turn_stats.text, text_target + " took " +  string(text_effect) + " damage");
		
	}
	
	array_push(obj_turn_stats.text, " ");
	remove_item(item,user)
	
}

/// @function use_item_status(item, target_array);
/// @param {item} item - the item to be used
/// @param {list} target_array the array of targets
/// @param {obj} user - The caller / user of the item
function use_item_status(item, target_array,user){
	
	array_push(obj_turn_stats.text, string(user.name) + " used " + string(item.name));
	
	for(k = 0; k < array_length(target_array); k++){
		switch(item){
		
			case item_poison_meat:
				target_array[k].hp += item.effect_amount;
				elemental_chance_item(item.element, target_array[k]);
				break;
		
		}
	}
	array_push(obj_turn_stats.text, " ");
	remove_item(item,user)
}

/// @function use_item_health(item, target_array);
/// @param {item} item - the item to be used
/// @param {list} target_array the array of targets
/// @param {obj} user - The caller / user of the item
function use_item_health(item, target_array,user){
	
	array_push(obj_turn_stats.text, string(user.name) + " used " + string(item.name));
	
	for(k = 0; k < array_length(target_array); k++){
		text_target = target_array[k].name;
		
		switch(item){
		
			case item_bandage:
			
				for(k = 0; k < array_length(target_array); k++){
					
					if(target_array[k].hp + item.effect_amount > target_array[k].max_hp){
						target_array[k].hp += target_array[k].max_hp - target_array[k].hp;
						text_effect = string(target_array[k].max_hp - target_array[k].hp);
					}else{
						target_array[k].hp += item.effect_amount;
						text_effect = string(item.effect_amount);
					}
				}
			
				break;
		
		}
		
		array_push(obj_turn_stats.text, text_target + " healed for " +  string(text_effect) + " health");
	}
	
	array_push(obj_turn_stats.text, " ");
	remove_item(item,user)
}

function remove_item(item_used,user){
	
	with(user){
		for(l = 0; l < array_length(item); l++){
			
			if(item[l].name = item_used.name){
				array_delete(item,l,1);	
				l = array_length(item);
			}
			
		}
	}
	
}