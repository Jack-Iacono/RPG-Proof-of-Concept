/// @description Displays Data

print_text_box(player_stats_x, player_stats_y, c_white, c_black, "Player", seperation, width, font_stats);
print_text_box(player_stats_x, player_stats_y + 60, c_white, c_black, "Hp: " +  string(round(obj_player_battle.hp)) + " | EE: " + string(round(obj_player_battle.elemental_energy)), seperation, width, font_stats);

for(i = 0; i < array_length(obj_player_battle.status_array); i++){
	print_text_box(player_stats_x + (i * 70), player_stats_y + 120, obj_player_battle.status_array[i].color, c_black, obj_player_battle.status_array[i].abbreviation, seperation, width, font_stats);
}

for(i = 0; i < instance_number(obj_enemy_battle); i++){
	
	print_text_box(enemy_stats_x, enemy_stats_y + (i * 270), c_white, c_black, string(instance_find(obj_enemy_battle, i).name),seperation,width, font_stats);
	print_text_box(enemy_stats_x, enemy_stats_y + 60 + (i * 270), c_white, c_black, "Hp: " + string(round(instance_find(obj_enemy_battle, i).hp)) + " | EE: " + string(round(instance_find(obj_enemy_battle, i).elemental_energy)), seperation, width, font_stats); 
	
	for(j = 0; j < array_length(instance_find(obj_enemy_battle, i).status_array); j++){
		print_text_box(enemy_stats_x + (j * 70), enemy_stats_y + 120 + (i * 270), instance_find(obj_enemy_battle, i).status_array[j].color, c_black, instance_find(obj_enemy_battle, i).status_array[j].abbreviation, seperation, width, font_stats);

	}
	
}