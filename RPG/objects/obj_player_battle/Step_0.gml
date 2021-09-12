/// @description Applies status on turn

if(turn){

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

}