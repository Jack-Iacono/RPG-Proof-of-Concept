//Will need to overload some of these functions

///@function attack_physical(attacker, attack_object, defender, ...);
/// @param {obj} attacker - the attacking instance object
/// @param {obj} attack_object - The object representing the attack which will be used
/// @param {list} target_array- The list of defending parties (1 - 3)
function attack_physical(attacker, attack_object, target_array){
	
	//prints out attack name on use
	array_push(obj_turn_stats.text, attacker.name + " used " + string(attack_object.name));
	
	for(i = 0; i < array_length(target_array); i++){
		
		//show_debug_message("Attacker: " + attacker.name + " | attack_object: " + attack_object.name + " | Target: " + target_array[i].name);
		
		//Calculates Elemental Weakness
		if(target_array[i].weakness == attack_object.element){
			weakness_mult = 1.5;
		}else{
			weakness_mult = 1;
		}
		
		target_array[i].hp -= attacker.damage * attack_object.damage_multiplier * weakness_mult;
		array_push(obj_turn_stats.text, target_array[i].name + " took " + string(attacker.damage * attack_object.damage_multiplier * weakness_mult) + " damage");
		elemental_chance(attack_object.element, target_array[i]);
	}
	
	array_push(obj_turn_stats.text, " ");
	
}

///@function attack_physical(attacker, defender);
/// @param {obj} attacker - the attacking instance object
/// @param {obj} attack_object - The object representing the attack which will be used
/// @param {obj} target_array- The list of defending parties (1 - 3)
function attack_magical(attacker, attack_object, target_array){
	
	//prints out attack name on use
	array_push(obj_turn_stats.text, attacker.name + " used " + string(attack_object.name));
	
	for(i = 0; i < array_length(target_array); i++){
		//Calculates Elemental Weakness
		if(target_array[i].weakness == attack_object.element){
			weakness_mult = 1.5;
		}else{
			weakness_mult = 1;
		}
		
		if(attacker.elemental_energy >= attack_object.cost){
			target_array[i].hp -= attacker.damage * attack_object.damage_multiplier * weakness_mult;
			array_push(obj_turn_stats.text, target_array[i].name + " took " + string(attacker.damage * attack_object.damage_multiplier * weakness_mult) + " damage");
			elemental_chance_magic(attack_object.element, target_array[i]);
		}else{
			attack_object = attack_failed_spell;
			target_array[i].hp -= attacker.damage * attack_object.damage_multiplier;
			array_push(obj_turn_stats.text, target_array[i].name + " took " + string(attacker.damage * attack_object.damage_multiplier) + " damage");
		}
		
	}
	
	attacker.elemental_energy -= attack_object.cost;
	array_push(obj_turn_stats.text, " ");
	
}

///@function end_turn();
function end_turn(){
	
	for(i = 0; i < instance_number(obj_enemy_battle); i++){
		instance_find(obj_enemy_battle,i).turn = true;
	}	
	
	obj_player_battle.turn = true;
}