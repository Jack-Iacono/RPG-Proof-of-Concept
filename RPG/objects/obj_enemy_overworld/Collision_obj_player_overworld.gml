/// @description Starts Battle

enemy_amount = irandom_range(1,3);

//Pushes which enemies will be in battle_controller and their items
for(i = 0; i < enemy_amount; i++){

	enemy_type = irandom_range(0,array_length(enemy_spawns)-1);
	array_push(obj_battle_controller.actors_spawn, enemy_spawns[enemy_type]);
	
	for(j = 0; j < items_allowed; j++){

		item_type = irandom_range(0,array_length(possible_items)-1);
		obj_battle_controller.items_spawn_enemy[i][j] = possible_items[item_type];

	}

}

//Spawns all possible attacks for spawns
for(j = 0; j < array_length(attacks); j++){
		
	array_push(obj_battle_controller.attacks_spawn,attacks[j]);
		
}



show_debug_message("Assets Set");
obj_player_overworld.pass_info = true;
