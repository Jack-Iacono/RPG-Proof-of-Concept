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
	
	//Sets diagonal walk speed to match other walking speed
	if(h_move != 0 && v_move != 0){
		walk_speed = 5 * 0.707;	
	}else{
		walk_speed = 5;	
	}

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
