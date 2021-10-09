/// @description Does the moving of curosor and sets enemy array

if(array_length(enemy)-1 > instance_number(obj_enemy_battle)){
	array_delete(enemy,0,(array_length(enemy) - instance_number(obj_enemy_battle) - 1));	
}

for(i = 0; i < instance_number(obj_enemy_battle) + 1; i++){
	
	if(i < instance_number(obj_enemy_battle)){
		enemy[i] = instance_find(obj_enemy_battle,i);
	}else{
		enemy[i] = "Back"
	}
	
}

image_yscale = (array_length(text_array) * 80) / 14;