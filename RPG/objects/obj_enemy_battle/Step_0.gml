/// @description Waits for turn to move

if(turn){
	
	cheapest_spell = 0;
	
	//decides on cheapest spell
	for(i = 0; i < array_length(magic_attack_array) - 1; i++){
		if(magic_attack_array[i].cost < cheapest_spell){
			cheapest_spell = magic_attack_array[i].cost;
		}
	}
	
	//Only chooses magic if it has enough energy
	if(elemental_energy < cheapest_spell){
		rand_type = 0;
	}else{
		rand_type = irandom(1);
	}
	
	switch(rand_type){
	
		case 0:
		rand_attack =  irandom(array_length(phys_attack_array)-1);
		array_push(obj_battle_controller.cmd_selection, 0);
		array_push(obj_battle_controller.turn_order, self);
		array_push(obj_battle_controller.attack_object, phys_attack_array[rand_attack]);
		show_debug_message("Pushed: " + name);
		break;
		
		case 1:
		rand_attack =  irandom(array_length(magic_attack_array)-1);
		array_push(obj_battle_controller.cmd_selection, 1);
		array_push(obj_battle_controller.turn_order, self);
		array_push(obj_battle_controller.attack_object, magic_attack_array[rand_attack]);
		show_debug_message("Pushed: " + name);
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