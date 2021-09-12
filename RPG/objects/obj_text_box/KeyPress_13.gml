/// @description Destroy Object

for(i = 0; i < instance_number(obj_enemy_battle); i++){
	instance_find(obj_enemy_battle,i).turn = true;
}
instance_destroy();