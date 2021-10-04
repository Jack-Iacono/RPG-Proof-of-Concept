/// @description Storage for variables and stuff needed later should also set up battle

//Sets Things that have to be initialized
if(room = room_battle){
	//Sets actors to be spawned
	actors_spawn[0] = obj_player_battle;

	//Sets attacks to be spawned (change later)
	attacks_spawn[0] = attack_failed_spell;
	
	//Sets Displays to be shown
	display_spawn[0] = obj_battle_commands;
	display_spawn[1] = obj_turn_stats;
	display_spawn[2] = obj_general_display;
	display_spawn[3] = obj_text_box;
	
	//Initializes arrays
	items_spawn_enemy[0] = obj_item;
	array_delete(items_spawn_enemy, 0, 1);
	
	items_spawn_player[0] = obj_item;
	array_delete(items_spawn_player, 0 ,1);

//Creates Instances

	//Spawns Elements
	for(i = 0; i < array_length(elements_spawn); i++){
		instance_create_layer(x,y,"Attacks_Elements",elements_spawn[i]);	
	}

	//Spawns Attacks
	for(i = 0; i < array_length(attacks_spawn); i++){
		instance_create_layer(x,y,"Attacks_Elements",attacks_spawn[i]);
	}
	
	//Spawns Items
	for(i = 0; i < array_length(items_spawn_player); i++){
		instance_create_layer(x,y,"Attacks_Elements",items_spawn_player[i]);	
	}
	
	//Spawns Items
	for(i = 0; i < array_length(items_spawn_enemy); i++){
		
		for(j = 0; j < array_length(items_spawn_enemy[i]); j++){
			if(!instance_exists(items_spawn_enemy[i])){
				instance_create_layer(x,y,"Attacks_Elements",items_spawn_enemy[i]);
			}
			
			array_push(instance_find(obj_enemy_battle, i).item, items_spawn_enemy[i][j]);
		}
	}
	

	//Spawns Actors
	for(i = 0; i < array_length(actors_spawn); i++){
		instance_create_layer(x,y,"Actors",actors_spawn[i]);	
	}
	
	//Spawns Displays
	for(i = 0; i < array_length(display_spawn); i++){
		instance_create_layer(x,y,"Displays",display_spawn[i]);	
	}
	
	//Spawns Location controller
	instance_create_layer(x,y,"Displays",obj_location_controller);




	//Initializes Arrays

	player_target_array[0] = obj_enemy_battle;
	array_delete(player_target_array, 0, 1);

	attack_object[0] = obj_attack_physical;
	array_delete(attack_object, 0, 1);

	cmd_selection[0] = 1;
	array_delete(cmd_selection, 0, 1);

	turn_order[0] = obj_player_battle;
	array_delete(turn_order, 0, 1);

	enemy_items[0] = obj_item;
	array_delete(enemy_items, 0, 1);


	enemy_target_array[0] = obj_player_battle;

	sorted = false;

	//Disable for set seed, Enable for random seed
	randomize();

	//random_set_seed(2630065366);
	show_debug_message("Seed: " + string(random_get_seed()));

}