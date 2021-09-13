// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Will need to overload some of these functions

///@function attack_physical(attacker, attack_object, defender, ...);
/// @param {obj} attacker - the attacking instance object
/// @param {obj} attack_object - The object representing the attack which will be used
/// @param {obj} target_array- The list of defending parties (1 - 3)
function attack_physical(attacker, attack_object, target_array){
	
	for(i = 0; i < array_length(target_array); i++){
		//Calculates Elemental Weakness
		if(target_array[i].weakness == attack_object.element){
			weakness_mult = 1.5;
		}else{
			weakness_mult = 1;
		}
		
		target_array[i].hp -= attacker.damage * attack_object.damage_multiplier * weakness_mult;
		elemental_chance(attack_object.element, target_array[i]);
		
		if(target_array[i].name = obj_player_battle.name){
			array_push(obj_pop_up.status_text, ": " + string(attacker.damage * attack_object.damage_multiplier * weakness_mult) + " dmg");
			array_push(obj_pop_up.defender_text, target_array[i].name);
			array_push(obj_pop_up.text_alpha, 1);
		}
		
	}
	
}

///@function attack_physical(attacker, defender);
/// @param {obj} attacker - the attacking instance object
/// @param {obj} attack_object - The object representing the attack which will be used
/// @param {obj} target_array- The list of defending parties (1 - 3)
function attack_magical(attacker, attack_object, target_array){
	
	for(i = 0; i < array_length(target_array); i++){
		//Calculates Elemental Weakness
		if(target_array[i].weakness == attack_object.element){
			weakness_mult = 1.5;
		}else{
			weakness_mult = 1;
		}
		
		target_array[i].hp -= attacker.damage * attack_object.damage_multiplier * weakness_mult;
		show_debug_message("battle_commands Line 48: Attack_object cost: " + string(attack_object.cost));
		show_debug_message("battle_commands Line 49: Attacker Elemental Energy: " + string(attack_object.cost));
		elemental_chance_magic(attack_object.element, target_array[i]);
		
		if(target_array[i].name = obj_player_battle.name){
			array_push(obj_pop_up.status_text, ": " + string(attacker.damage * attack_object.damage_multiplier * weakness_mult) + " dmg");
			array_push(obj_pop_up.defender_text, target_array[i].name);
			array_push(obj_pop_up.text_alpha, 1);
		}
		
	}
	
	attacker.elemental_energy -= attack_object.cost;
	
}

///@function end_turn();
function end_turn(){
	if(!instance_exists(obj_text_box)){
		for(i = 0; i < instance_number(obj_enemy_battle); i++){
			instance_find(obj_enemy_battle,i).turn = true;
		}
	}	
	obj_player_battle.turn = true;
}