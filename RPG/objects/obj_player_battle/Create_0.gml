/// @description Sets Location to anchor location and sets random seed

x = obj_playerStand.x;
y = obj_playerStand.y;

//Initialize Status Array,  come back to this
status_array[0] = pointer_null;
array_delete(status_array, 0, 1);

//Initialize Turn Array
turn_array[0] = pointer_null;
array_delete(turn_array, 0, 1);

//Initializes Item Array
item[0] = pointer_null;
array_delete(item,0,1);