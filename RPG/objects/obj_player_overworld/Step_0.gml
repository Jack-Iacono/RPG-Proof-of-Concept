/// @description Controls Movement

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
