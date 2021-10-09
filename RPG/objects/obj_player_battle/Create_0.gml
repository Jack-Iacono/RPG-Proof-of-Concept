/// @description Sets Location to anchor location and sets random seed

x = obj_playerStand.x;
y = obj_playerStand.y;

//Initialize Status Array,  come back to this
status_array = array_create(0);

//Initialize Turn Array
turn_array = array_create(0);

//Initializes Item Array
item = array_create(0);

//Sets Player Health and elementel energy
max_hp = obj_pass_controller.player_max_hp;
hp = obj_pass_controller.player_hp;
elemental_energy = obj_pass_controller.player_ee;