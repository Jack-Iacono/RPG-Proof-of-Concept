/// @description Storage for variables and stuff needed later should also set up battle

actors_spawn[0] = obj_player_battle;

//Initializes arrays
	items_spawn_enemy = array_create(0);
	items_spawn_player = array_create(0);
	attacks_spawn = array_create(0);
	player_target_array = array_create(0);
	attack_object = array_create(0);
	cmd_selection = array_create(0);
	turn_order = array_create(0);
	enemy_items = array_create(0);
	
//Set all elements here, may need later
	elements_spawn[0] = element_flame;
	elements_spawn[1] = element_poison;
	elements_spawn[2] = element_none;
	
//Sets other things that need to be set
	enemy_target_array[0] = obj_player_battle;

	sorted = false;
