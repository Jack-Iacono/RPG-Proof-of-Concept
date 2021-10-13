/// @description Destroys enemy if player defeated it, but leaves it if player ran

if(room != room_battle && !run && battle_over){
	instance_destroy(calling_instance);
	battle_over = false;
}