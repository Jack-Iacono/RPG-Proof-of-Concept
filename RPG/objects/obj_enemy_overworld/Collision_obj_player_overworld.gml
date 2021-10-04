/// @description Starts Battle

enemy_amount = irandom_range(1,3);

//Pushes which enemies will be in battle_controller and their items
for(i = 0; i < enemy_amount; i++){

	enemy_type = irandom_range(0,array_length(enemy_spawns)-1);
	array_push(obj_battle_controller.actors_spawn, enemy_spawns[enemy_type]);
	
	for(j = 0; j < items_allowed; j++){

		item_type = irandom_range(0,array_length(possible_items)-1);
		array_push(obj_battle_controller.items_spawn_enemy[i], items_spawn_enemy[item_type]);

	}

}

//Spawns all possible attacks for spawns
for(j = 0; j < array_length(attacks); j++){
		
	array_push(obj_battle_controller.attacks_spawn,attacks[j]);
		
}

//Sets player attacks into battle
with(obj_battle_controller){
	//Sets player stuff
	if(room != room_battle){
		for(i = 0; i < obj_player_overworld.attack_inventory; i++){
			array_push(attacks_spawn, obj_player_overworld.attack_inventory[i]);
		}
	}	
}



show_debug_message("Assets Set");
room = room_battle;
