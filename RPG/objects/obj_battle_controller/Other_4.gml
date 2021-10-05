/// @description Storage for variables and stuff needed later should also set up battle

//Sets Things that have to be initialized
if(room = room_battle){
	//Sets actors to be spawned
	actors_spawn[0] = obj_player_battle;

	//Sets attacks to be spawned (change later)
	array_push(attacks_spawn, attack_failed_spell);
	
	//Sets Displays to be shown
	display_spawn[0] = obj_battle_commands;
	display_spawn[1] = obj_turn_stats;
	display_spawn[2] = obj_general_display;
	display_spawn[3] = obj_text_box;

//Creates Instances

	//Spawns Elements
	show_debug_message("Elements (" + string(array_length(elements_spawn)) + ")--------------------");
	for(i = 0; i < array_length(elements_spawn); i++){
		instance_create_layer(x,y,"Attacks_Elements",elements_spawn[i]);
		show_debug_message(elements_spawn[i].name);
	}

	//Spawns Attacks
	show_debug_message("Attacks--------------------");
	for(i = 0; i < array_length(attacks_spawn); i++){
		instance_create_layer(x,y,"Attacks_Elements",attacks_spawn[i]);
		show_debug_message(attacks_spawn[i].name);
	}

	//Spawns Actors
	show_debug_message("Actors--------------------");
	for(i = 0; i < array_length(actors_spawn); i++){
		instance_create_layer(x,y,"Actors",actors_spawn[i]);
		show_debug_message(actors_spawn[i].name);
	}
	
	//Spawns Items for enemies
	show_debug_message("Enemy Items--------------------");
	for(i = 0; i < array_length(items_spawn_enemy); i++){
		
		for(j = 0; j < array_length(items_spawn_enemy[i]); j++){
			if(!instance_exists(items_spawn_enemy[i][j])){
				instance_create_layer(x,y,"Attacks_Elements",items_spawn_enemy[i][j]);
			}
			
			array_push(instance_find(obj_enemy_battle, i).item, items_spawn_enemy[i][j]);
			show_debug_message("Pushed: " + items_spawn_enemy[i][j].name + " to " + instance_find(obj_enemy_battle, i).name);
		}
	}
	
	//Spawns items for player
	for(i = 0; i < array_length(items_spawn_player); i++){
		if(!instance_exists(items_spawn_player[i])){
			instance_create_layer(x,y,"Attacks_Elements",items_spawn_player[i]);
		}
			
		array_push(obj_player_battle.item, items_spawn_player[i]);
		show_debug_message("Pushed: " + items_spawn_player[i].name + " to Player");
	}
	
	//Spawns Displays
	show_debug_message("Displays--------------------");
	for(i = 0; i < array_length(display_spawn); i++){
		instance_create_layer(x,y,"Displays",display_spawn[i]);	
		show_debug_message(display_spawn[i]);
	}
	
	//Spawns Location controller
	instance_create_layer(x,y,"Displays",obj_location_controller);


	//Disable for set seed, Enable for random seed
	randomize();

	//random_set_seed(2630065366);
	show_debug_message("Seed: " + string(random_get_seed()));

}