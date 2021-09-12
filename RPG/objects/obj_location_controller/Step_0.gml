/// @description Sets location of all enemies

if(instance_number(obj_enemy_battle) = 0){
	game_end();
}

//Assigns Enemies
for(i = 0; i < instance_number(obj_enemy_battle); i++){
	enemies[i] = instance_find(obj_enemy_battle,i);
	
}

//Assigns Anchors
for(i = 0; i < instance_number(obj_enemyStand); i++){
	anchors[i] = instance_find(obj_enemyStand,i);
}

for(i = 0; i < array_length(enemies); i++){
	enemies[i].x = anchors[i].x;
	enemies[i].y = anchors[i].y;
}