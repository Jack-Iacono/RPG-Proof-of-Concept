/// @description Moves to location anchor


//Initialize Enemy Inventory (Do Later, have to create item system)
for(i = 0; i < items_allowed; i++){
	show_debug_message("Ran Loop");
	item[i] = obj_battle_controller.items_spawn_enemy[random(array_length(obj_battle_controller.items_spawn_enemy)) - 1];
}

//Initialize Target Array for attack phase
target_array[0] = obj_player_battle;

//Initialize Status Array,  come back to this
status_array[0] = element_flame;
array_delete(status_array, 0, 1);

//Initialize Turn Array
turn_array[0] = element_flame.duration;
array_delete(turn_array, 0, 1);