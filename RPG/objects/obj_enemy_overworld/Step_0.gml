/// @description Moves Around

//If move timer has allowed movement or chase after player
if(collision_circle(x,y,aggro_range, obj_player_overworld,false,true) && obj_player_overworld.collision){
		move_towards_point(obj_player_overworld.x, obj_player_overworld.y, chase_speed);
}else if(move){
	
	if(distance_to_point(home_x, home_y) > tether_distance){
		move_towards_point(home_x, home_y, move_speed);
	}else{	
		move_dir = irandom_range(1,15);
		
		//Allows for variation in which way enemy moves
		y_rand = irandom_range(20,60);
		x_rand = irandom_range(20,60);
	
		switch(move_dir){
	
			case 1:
				move_towards_point(x + x_rand, y, move_speed);
				break;
			case 2:
				move_towards_point(x - x_rand, y, move_speed);
				break;
			case 3:
				move_towards_point(x, y  + y_rand, move_speed);
				break;
			case 4:
				move_towards_point(x, y  - y_rand, move_speed);
				break;
			case 5:
				move_towards_point(x + x_rand, y + y_rand, move_speed);
				break;
			case 6:
				move_towards_point(x + x_rand, y - y_rand, move_speed);
				break;
			case 7:
				move_towards_point(x - x_rand, y + y_rand, move_speed);
				break;
			case 8:
				move_towards_point(x - x_rand, y - y_rand, move_speed);
				break;
			default:
				speed = 0;
				break;
	
		}
	}
	
	move = false;
	alarm[0] = move_timer;
}