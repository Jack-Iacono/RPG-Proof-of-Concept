/// @description Initialize Arrays Here

//Sets Attacks which all instances can use (Even elemental Variants)
attacks[0] = enemy_attack_slime;
attacks[1] = enemy_attack_slime_absorb;
attacks[2] = enemy_attack_slime_magma;
attacks[3] = enemy_attack_slime_poison;

//Sets enemies which can spawn from encounter
enemy_spawns[0] = enemy_slime;
enemy_spawns[1] = enemy_slime_magma;
enemy_spawns[2] = enemy_slime_poison;

//Sets items which can be given to enemies
possible_items[0] = item_bandage;
possible_items[1] = item_rocket;
possible_items[2] = item_poison_meat;

//Does the storing for what enemies will spawn
event_inherited();
