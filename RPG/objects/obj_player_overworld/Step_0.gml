/// @description Controls Movement

//Moves only if it has control
if(control){
	//Gets values for all direction keys pressed
	right = keyboard_check(vk_right);
	left = keyboard_check(vk_left);
	up = keyboard_check(vk_up);
	down = keyboard_check(vk_down);

	//converts above values to 1,0, or -1
	h_move = right - left;
	v_move = down - up;

	//Moves Player
	if(!place_meeting(x + (h_move * walk_speed), y + (v_move * walk_speed), obj_wall)){
		x += h_move * walk_speed;
		y += v_move * walk_speed;
	}else if(!place_meeting(x + (h_move * walk_speed), y, obj_wall)){
		x += h_move * walk_speed;
	}else if(!place_meeting(x, y + (v_move * walk_speed), obj_wall)){
		y += v_move * walk_speed;
	}
}

if(pass_info){
	
	//Passes all attacks to battle controller
	for(i = 0; i < array_length(attack_inventory); i++){
		array_push(obj_battle_controller.attacks_spawn,attack_inventory[i]);
	}
	
	//Passes all items to battle controller
	for(i = 0; i < array_length(item_inventory); i++){
		array_push(obj_battle_controller.items_spawn_player, item_inventory[i]);	
	}
	
	pass_info = false;
	room = room_battle;
}
