/// @description Moves to location anchor


//Initialize Enemy Inventory (Do Later, have to create item system)
item[0] = "Rocket";

//Initialize Target Array for attack phase
target_array[0] = obj_player_battle;

//Initialize Status Array,  come back to this
status_array[0] = element_flame;
array_delete(status_array, 0, 1);

//Initialize Turn Array
turn_array[0] = element_flame.duration;
array_delete(turn_array, 0, 1);