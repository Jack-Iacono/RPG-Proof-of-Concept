/// @description Storage for variables and stuff needed later should also set up battle

actors_spawn[0] = obj_player_battle;

/*
//Sets Things that have to be initialized

	//Sets actors to be spawned
	actors_spawn[0] = obj_player_battle;
	actors_spawn[1] = enemy_slime;
	actors_spawn[2] = enemy_slime_magma;
	actors_spawn[3] = enemy_slime_poison;

	//Sets attacks to be spawned (change later)
	attacks_spawn[0] = attack_sword;
	attacks_spawn[1] = attack_punch;
	attacks_spawn[2] = attack_hammer;
	attacks_spawn[3] = attack_flamewall;
	attacks_spawn[4] = attack_poison_puddle;
	attacks_spawn[5] = attack_ethereal_knife;
	attacks_spawn[6] = attack_failed_spell;
	attacks_spawn[7] = enemy_attack_slime;
	attacks_spawn[8] = enemy_attack_slime_absorb;
	attacks_spawn[9] = enemy_attack_slime_magma;
	attacks_spawn[10] = enemy_attack_slime_poison;

	//Sets elements to be spawned
	elements_spawn[0] = element_flame;
	elements_spawn[1] = element_poison;
	elements_spawn[2] = element_none;
	
	//Sets Displays to be shown
	display_spawn[0] = obj_battle_commands;
	display_spawn[1] = obj_turn_stats;
	display_spawn[2] = obj_general_display;
	display_spawn[3] = obj_text_box;

	//Sets items to be spawned
	items_spawn_player[0] = item_bandage;
	items_spawn_player[1] = item_rocket;
	items_spawn_player[2] = item_poison_meat;
	
	//Sets items to be spawned
	items_spawn_enemy[0] = item_bandage;
	items_spawn_enemy[1] = item_rocket;
	items_spawn_enemy[2] = item_poison_meat;

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
		instance_create_layer(x,y,"Attacks_Elements",items_spawn_enemy[i]);	
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
*/