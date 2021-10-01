/// @description Waits for turn to move

if(turn){
	
	cheapest_spell = 0;
	
	//decides on cheapest spell
	for(i = 0; i < array_length(magic_attack_array) - 1; i++){
		if(magic_attack_array[i].cost < cheapest_spell){
			cheapest_spell = magic_attack_array[i].cost;
		}
	}
	
	show_debug_message("Item Length: " + string(array_length(item)));
	
	//Only chooses magic if it has enough energy
	if(elemental_energy < cheapest_spell){
		rand_type = 0;
	}else if(array_length(item) > 0){
		rand_type = irandom(2);
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
		
		case 2:
			array_push(obj_battle_controller.cmd_selection, 2);
			array_push(obj_battle_controller.turn_order, self);
			array_push(obj_battle_controller.enemy_items, item[0]);
			
			//Need to push through an attack for battle controller sort to work
			//Yes I know I should fix it, I don't feel like it
			rand_attack =  irandom(array_length(phys_attack_array)-1);
			array_push(obj_battle_controller.attack_object, phys_attack_array[rand_attack]);
			
			show_debug_message("Pushed: " + name);
			break;
	
	}
	
	turn = false;
	obj_battle_controller.start_fight = true;
	
}



//!!Temporary!! Gets rid of enemy when health is at 0, without breaking the rest of the code
if(hp <= 0){
	instance_destroy();
}