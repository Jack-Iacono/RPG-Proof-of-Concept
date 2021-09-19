/// @description Sets Location to anchor location and sets random seed

x = obj_playerStand.x;
y = obj_playerStand.y;

//Initialize Status Array,  come back to this
status_array[0] = element_flame;
array_delete(status_array, 0, 1);

//Initialize Turn Array
turn_array[0] = element_flame.duration;
array_delete(turn_array, 0, 1);