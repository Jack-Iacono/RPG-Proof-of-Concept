// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function delete_target_markers(){

	for(i = instance_number(obj_target_marker); i >= 0; i--){
		instance_destroy(instance_find(obj_target_marker,i));	
	}

}

function delete_inspect_markers(){

	for(i = instance_number(obj_inspect_marker); i >= 0; i--){
		instance_destroy(instance_find(obj_inspect_marker,i));	
	}

}

/// @function array_initialize(array_name, calling_instance);
/// @param {array} array_name - The name of the array to be cleared
/// @param {obj} calling_instance - The object for whom the array is being initialized
function array_clear(array_name, calling_instance){
	with(calling_instance){
		array_delete(calling_instance, 0, array_length(array_name));
	}
}
	