/// @description Insert description here
// You can write your code in this editor

clothing_counter = 0;

has_briefcase = false;
has_cravate = false;
has_monocle = false;
has_all_from_s1 = false;

has_goggles = false;
has_snorkel = false;
has_floaties = false;
has_all_from_s2 = false;

has_helm = false;
has_armor = false;
has_boots = false;
has_all_from_s3 = false;

has_all = false;

wear_professional = false;
wear_swim = false;
wear_knight = false;
dressed = false;


colliding_with_scientist_1 = false;
colliding_with_scientist_2 = false;
colliding_with_scientist_3 = false;
colliding_with_door = false;
colliding_with_mirror = false;

colliding_with_book = false;
colliding_with_book1 = false;
colliding_with_book2 = false;
colliding_with_book3 = false;
colliding_with_book4 = false;
colliding_with_book5 = false;
colliding_with_book6 = false;
colliding_with_book7 = false;
colliding_with_book8 = false;
colliding_with_book9 = false;
colliding_with_book10 = false;

convo_in_progress = false;

scientist1_counter = 0;
scientist2_counter = 0;
scientist3_counter = 0;

question_counter = 0;


clothing_item_1 = -1;
clothing_item_2 = -1;
clothing_item_3 = -1;
clothing_item_counter = 0;
dress_up_time = false;

SCALE_MULTIPLIER = 4 / 3;

//track number of correct answers per scientist
scientist1_correct = 0;
scientist2_correct = 0;
scientist3_correct = 0;


obj_clothing_controller.used_rand_branches = []; 

current_rand = -1;

global.chatterbox_clothing = noone;

just_entered = true;

clothing_from_s1 = 0;
clothing_from_s2= 0;
cloting_from_s3 = 0;

ready_for_results_1 = false;
ready_for_results_2 = false;

wait_timer = 1600;

number_professional = 0;

clothing_points = 0;
intro = true;
intro_counter = 600;