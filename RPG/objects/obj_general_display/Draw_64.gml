/// @description Displays Data

print_text_box(player_stats_x, player_stats_y, c_white, c_black, "Player Health: " + string(obj_player_battle.hp), seperation, width, font_stats);
print_text_box(player_stats_x, player_stats_y + 100, c_white, c_black, "Player Energy: " + string(obj_player_battle.elemental_energy), seperation, width, font_stats);

for(i = 0; i < array_length(obj_player_battle.status_array); i++){
	print_text_box(player_stats_x, player_stats_y + 200 + (i * 100), c_white, c_black, obj_player_battle.status_array[i].name + ": " + string(obj_player_battle.turn_array[i] + 1) + " turns", seperation, width, font_stats);
}

for(i = 0; i < instance_number(obj_enemy_battle); i++){
	
	print_text_box(enemy_stats_x, enemy_stats_y + (i * 180), c_white, c_black, string(instance_find(obj_enemy_battle, i).name) + " Health: " + string(instance_find(obj_enemy_battle, i).hp),seperation,width, font_stats);
	
}