/// @description Storage for variables and stuff needed later should also set up battle

//obj_battle_commands.section = 0;

//Initializes Arrays

player_target_array[0] = obj_enemy_battle;
array_delete(player_target_array, 0, 1);

attack_object[0] = obj_attack_physical;
array_delete(attack_object, 0, 1);

cmd_selection[0] = 1;
array_delete(cmd_selection, 0, 1);

turn_order[0] = obj_player_battle;
array_delete(turn_order, 0, 1);