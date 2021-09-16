/// @description Waits for turn to move

if(turn){
	
	
	rand_type = irandom(1);
	
	switch(rand_type){
	
		case 0:
		rand_attack =  irandom(array_length(phys_attack_array)-1);
		array_push(obj_battle_controller.cmd_selection, 0);
		array_push(obj_battle_controller.turn_order, self.id);
		array_push(obj_battle_controller.attack_object, phys_attack_array[rand_attack]);
		show_debug_message("Pushed Enemy Information");
		break;
		
		case 1:
		rand_attack =  irandom(array_length(magic_attack_array)-1);
		array_push(obj_battle_controller.cmd_selection, 1);
		array_push(obj_battle_controller.turn_order, self.id);
		array_push(obj_battle_controller.attack_object, magic_attack_array[rand_attack]);
		show_debug_message("Pushed Enemy Information");
		break;
	
	}
	
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
		show_debug_message("Engage elemental effect");
		elemental_effect(status_array[i], self.id);
		turn_array[i] -= 1;
	}
	
	turn = false;
	//May have to move somewhere else later
	obj_battle_controller.start_fight = true;
	
}



//!!Temporary!! Gets rid of enemy when health is at 0, without breaking the rest of the code
if(hp <= 0){
	instance_destroy();
}