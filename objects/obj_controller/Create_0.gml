spawn_timer = 0;
spawn_interval = 120; // time between customer spawns
selected_customer = noone;  // start with no customer selected
selected_pizza = noone;
player_money = 0;
game_paused = false;

global.plates = array_create(7);

// Assign each plate instance to the array
global.plates[0] = plate_0;
global.plates[1] = plate_1;
global.plates[2] = plate_2;
global.plates[3] = plate_3;
global.plates[4] = plate_4;
global.plates[5] = plate_5;
global.plates[6] = plate_6;

//unique customer_id
global.customer_counter = 0;