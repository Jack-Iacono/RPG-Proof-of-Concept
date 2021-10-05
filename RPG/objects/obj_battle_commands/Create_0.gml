/// @description Initializes array options and car settings

//Sets position
x = 0;
y = 0;


//Options for main command
command[0] = "Attack";
command[1] = "Inspect";
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
magic[0] = obj_attack;
array_delete(magic,0,1);
for(i = 0; i < instance_number(obj_attack_magical); i++){
	//magic[i] = instance_find(obj_attack_magical,i);
	if(instance_find(obj_attack_magical,i) != attack_failed_spell){
		array_push(magic,instance_find(obj_attack_magical,i));
	}
}
array_push(magic, "Back");

//Initialize Items (Change to work like magic attacks do, No)
for(i = 0; i < array_length(obj_player_battle.item); i++){
	item[i] = obj_player_battle.item[i];
}
array_push(item, "Back");

//Initialize Enemy Array
enemy[1] = "Back";

//initialize target array
target_array[0] = obj_enemy_battle;

//Initializes all attack array
all_attack[0] = "All";
all_attack[1] = "Back";

//I'm just too lazy to make a new function to print this
cont[0] = "Press";
cont[1] = "Enter";
cont[2] = "To";
cont[3] = "Continue";


cursor_y[0] = 700;

text_array[0] = "";
array_delete(text_array,0,1);
		