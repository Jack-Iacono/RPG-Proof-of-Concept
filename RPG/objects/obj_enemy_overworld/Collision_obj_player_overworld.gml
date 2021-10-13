/// @description Starts Battle

if(obj_player_overworld.collision){
	obj_pass_controller.pass_info = true;
	obj_pass_controller.calling_instance = self.id;
}

//instance_destroy();