/// @description Moves Around

//Sets the distance that the player is from the enemy
player_dist = sqrt(power((obj_player_overworld.x - x),2) + power((obj_player_overworld.y - y),2));

//If move timer has allowed movement or chase after player
if(collision_circle(x,y,aggro_range, obj_player_overworld,false,true) && obj_player_overworld.collision){	
	x_move = (obj_player_overworld.x - x) / player_dist;
	y_move = (obj_player_overworld.y - y) / player_dist;
}else if(distance_to_point(home_x, home_y) > tether_distance){
	x_move = (home_x - x) / player_dist;
	y_move = (home_y - y) / player_dist;
}else if(move){
	
	x_move = random_range(-1,1);
	y_move = random_range(-1,1);
	
	move = false;
	alarm[0] = move_timer;
}

if(!place_meeting(x + (x_move * move_speed), y + (y_move * move_speed), obj_wall)){
	x += x_move * move_speed;
	y += y_move * move_speed;
}else if(!place_meeting(x + (x_move * move_speed), y, obj_wall)){
	x += x_move * move_speed;
}else if(!place_meeting(x, y + (y_move * move_speed), obj_wall)){
	y += y_move * move_speed;
}