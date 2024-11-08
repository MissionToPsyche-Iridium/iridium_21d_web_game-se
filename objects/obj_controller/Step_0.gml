if (global.gamepaused) {
	show_debug_message("Game paused");
    // Deactivate all instances except the controller to pause the game
    //instance_deactivate_object(inst_27313940); //obj_table 1
	//instance_deactivate_object(inst_60E9FA6A); //obj_table 2
	//instance_deactivate_object(inst_A9CA90D); //obj_table 3
	//instance_deactivate_object(inst_1C5C055F); //obj_table 4
	//instance_deactivate_object(inst_4F22473A); //obj_counter
	//instance_deactivate_object(inst_2D4F779F); //obj_clock
	//instance_deactivate_object(inst_74CAE414); //obj_sign
	instance_deactivate_object(inst_54E540F5); //obj_lula_pizza
	instance_deactivate_object(inst_36958C6C); //obj_chef
	
} else {
	if(obj_pause.pause_clicked && !global.gamepaused) {
		//instance_activate_object(inst_27313940); //obj_table 1
		//instance_activate_object(inst_60E9FA6A); //obj_table 2
		//instance_activate_object(inst_A9CA90D); //obj_table 3
		//instance_activate_object(inst_1C5C055F); //obj_table 4
		//instance_activate_object(inst_4F22473A); //obj_counter
		//instance_activate_object(inst_2D4F779F); //obj_clock
		//instance_activate_object(inst_74CAE414); //obj_sign
		instance_activate_object(inst_54E540F5); //obj_lula_pizza
		instance_activate_object(inst_36958C6C); //obj_chef
	}
	// Increment the spawn timer
spawn_timer += 1;

// Check if any customer is near the carpet area
var customer_waiting = false;  // Initialize as false

// Loop through all obj_customer instances and check their position
with (obj_customer) {
    if (point_distance(x, y, 50, 576) < 10) {
        customer_waiting = true; 
        break; 
    }
}

// spawn logic
if (spawn_timer >= spawn_interval && !customer_waiting) {
    if (customers_remaining == 0) {
	instance_deactivate_object(inst_54E540F5); //obj_lula_pizza
	instance_deactivate_object(inst_36958C6C); //obj_chef
	instance_deactivate_object(obj_plate);
	instance_deactivate_object(obj_customer);
	instance_deactivate_object(obj_table);
	game_over = true;
	} else if (spawn_counter == 2) {
		instance_create_layer(70, 504, "Instances", obj_sign_closed);
	} else {
	// spawn customer off-screen at (0, 576)
    var customer = instance_create_layer(0, 576, "Instances", obj_customer);
    
    show_debug_message("customers_remaining = " + string(customers_remaining));
    // reset the timer
    spawn_timer = 0; 
	spawn_counter++;
	}
} 
}