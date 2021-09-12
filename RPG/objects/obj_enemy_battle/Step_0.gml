/// @description Waits for turn to move

if(turn){
	
	rand = random(array_length(attack_array));
	
	attack_physical(self.id, attack_array[rand], target_array);
	
	//Need second array to avoid skipping of status charges
	if(array_length(turn_array) != 0){
		for(i = array_length(status_array) - 1; i >= 0; i--){
			if(turn_array[i] == 0){
				array_delete(status_array,i,1);	
				array_delete(turn_array,i,1);
			}
		}
	}
	
	//Applies status over turns
	for(i = 0; i < array_length(status_array); i++){
		elemental_effect(status_array[i], self.id);
		turn_array[i] -= 1;
	}
	
	turn = false;
	
	obj_battle_commands.section = 0;
	
}



//!!Temporary!! Gets rid of enemy when health is at 0, without breaking the rest of the code
if(hp <= 0){
	instance_destroy();
}