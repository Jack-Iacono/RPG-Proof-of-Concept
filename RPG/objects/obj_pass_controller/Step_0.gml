/// @description Controls the passing of information into the battle

if(pass_info){
	
	//Sets room to return to
	return_room = room;
	
	with(obj_player_overworld){
		//Passes all attacks to battle controller
		for(i = 0; i < array_length(attack_inventory); i++){
			array_push(obj_battle_controller.attacks_spawn,attack_inventory[i]);
		}
	
		//Passes all items to battle controller
		for(i = 0; i < array_length(item_inventory); i++){
			array_push(obj_battle_controller.items_spawn_player, item_inventory[i]);	
		}
	}
	
	//Passes Health and other things to battle controller
	player_hp = obj_player_overworld.hp;
	player_max_hp = obj_player_overworld.max_hp;
	player_ee = obj_player_overworld.elemental_energy;
	
	with(calling_instance){
		
		enemy_amount = irandom_range(1,3);

		//Pushes which enemies will be in battle_controller and their items
		for(i = 0; i < enemy_amount; i++){

			enemy_type = irandom_range(0,array_length(enemy_spawns)-1);
			array_push(obj_battle_controller.actors_spawn, enemy_spawns[enemy_type]);
	
			for(j = 0; j < items_allowed; j++){

				item_type = irandom_range(0,array_length(possible_items)-1);
				obj_battle_controller.items_spawn_enemy[i][j] = possible_items[item_type];

			}
		}

		//Spawns all possible attacks for spawns
		for(j = 0; j < array_length(attacks); j++){	
			array_push(obj_battle_controller.attacks_spawn,attacks[j]);	
		}

		show_debug_message("Enemy Assets Set");
	}
	
	
	pass_info = false;
	instance_destroy(calling_instance);
	room = room_battle;
}
	
if(set_player_values && instance_exists(obj_player_overworld)){
	
	obj_player_overworld.hp = player_hp;
	obj_player_overworld.max_hp = player_max_hp;
	obj_player_overworld.elemental_energy = player_ee;
	
	array_clear(obj_player_overworld.item_inventory,obj_player_overworld);
	
	for(i = 0; i < array_length(player_items); i++){
		obj_player_overworld.item_inventory[i] = player_items[i];	
	}
	
	set_player_values = false;
}

if(room = room_initialize){
	room_goto_next();	
}