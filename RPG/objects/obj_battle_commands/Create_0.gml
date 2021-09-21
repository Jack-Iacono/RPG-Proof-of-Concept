/// @description Initializes array options and car settings

//Options for main command
command[0] = "Attack";
command[1] = "Strategy";
command[2] = "Item";
command[3] = "Run";

//Attack Menu Options
attack[0] = "Physical";
attack[1] = "Magic";
attack[2] = "Back";

//Physical Attack Options (Need the Last item in array for printing purposes, it doesn't matter what it would say as it will always print "Back")
physical[0] = attack_punch;
physical[1] = attack_hammer;
physical[2] = attack_sword;
physical[3] = "Back";

//Magic Attack Options
for(i = 0; i < instance_number(obj_attack_magical); i++){
	magic[i] = instance_find(obj_attack_magical,i);
}
array_push(magic, "Back");

//Strategy Menu Options
strat[0] = "Inspect";
strat[1] = "Enhance Attack";
strat[2] = "Back";

//Initialize elsewhere
item[0] = "empty"
item[1] = "Back";

//Initialize Enemy Array
enemy[1] = "Back";

//initialize target array
target_array[0] = obj_enemy_battle;


cursor_y[0] = 700;

text_array[0] = "";
array_delete(text_array,0,1);
		