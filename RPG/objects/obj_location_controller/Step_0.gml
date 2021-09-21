/// @description Sets location of all enemies

//Assigns Enemies
for(i = 0; i < instance_number(obj_enemy_battle); i++){
	enemies[i] = instance_find(obj_enemy_battle,i);
}
array_resize(enemies,instance_number(obj_enemy_battle));

//Assigns Anchors
for(i = 0; i < instance_number(obj_enemyStand); i++){
	anchors[i] = instance_find(obj_enemyStand,i);
}


	show_debug_message("Enemies Array Length: " + string(array_length(enemies)));
for(i = 0; i < array_length(enemies); i++){
	enemies[i].x = anchors[i].x;
	enemies[i].y = anchors[i].y;
}