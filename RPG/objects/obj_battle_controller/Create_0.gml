/// @description Storage for variables and stuff needed later should also set up battle

actors_spawn[0] = obj_player_battle;

//Initializes arrays
	items_spawn_enemy[0] = pointer_null;
	array_delete(items_spawn_enemy, 0, 1);
	
	items_spawn_player[0] = pointer_null;
	array_delete(items_spawn_player, 0 ,1);
	
	attacks_spawn[0] = pointer_null;
	array_delete(attacks_spawn, 0, 1);
	
	player_target_array[0] = pointer_null;
	array_delete(player_target_array, 0, 1);

	attack_object[0] = pointer_null;
	array_delete(attack_object, 0, 1);

	cmd_selection[0] = pointer_null;
	array_delete(cmd_selection, 0, 1);

	turn_order[0] = pointer_null;
	array_delete(turn_order, 0, 1);

	enemy_items[0] = pointer_null;
	array_delete(enemy_items, 0, 1);
	
	//Set all elements here, may need later
	elements_spawn[0] = element_flame;
	elements_spawn[1] = element_poison;
	elements_spawn[2] = element_none;
	

	enemy_target_array[0] = obj_player_battle;

	sorted = false;
