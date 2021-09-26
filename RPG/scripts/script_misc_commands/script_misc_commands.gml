// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function delete_target_markers(){

	for(i = instance_number(obj_target_marker); i >= 0; i--){
		instance_destroy(instance_find(obj_target_marker,i));	
	}

}