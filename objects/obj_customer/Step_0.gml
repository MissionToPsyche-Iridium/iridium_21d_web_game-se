if (global.gamepaused) {
	instance_deactivate_object(obj_customer);
	move_speed = 0;
} else {
	if (obj_pause.pause_clicked && !global.gamepaused) {
		instance_activate_object(obj_customer);
		move_speed = 2;
	}
	
	if (!ready_to_seat) {
    // Move the customer to the carpet at (50, 576)
    move_towards_point(50, 576, move_speed);
    
    // Check if the customer is close enough to the carpet and stop them
    if (point_distance(x, y, 50, 576) < 5) {
        ready_to_seat = true;  // Mark the customer as ready to be seated
        x = 50;  // Snap customer to carpet X position
        y = 576;  // Snap customer to carpet Y position

        // The customer should now wait here until interacted with
        speed = 0;  // Completely stop movement
    }
}

if (seated && !order_taken) {
    order_timer -= 1;  // Count down the timer
    
    if (order_timer <= 0) {
        ready_to_order = true;  // customer is ready to order
    }
}


if (ready_to_eat) {
    eating_timer -= 1;  // Count down the eating timer
    
    if (eating_timer <= 0) {
        show_debug_message("Customer finished eating and is leaving.");
        instance_destroy(id);  // Customer leaves the restaurant
        
		// Destroy pizza on table
		var pizza_found = false;

    // Loop through all potential pizza types and destroy the one with the matching customer_id
    var pizza_types = [obj_cheese, obj_pepperoni, obj_pineapple, obj_spinach];  // Add all pizza types here

    for (var i = 0; i < array_length(pizza_types); i++) {
        with (pizza_types[i]) {
            if (customer_id == other.id) {  // Check if this pizza belongs to the current customer
                instance_destroy();  // Destroy the pizza instance
                pizza_found = true;
                break;  // Exit the loop once the correct pizza is found and destroyed
            }
        }
        if (pizza_found) break;  // Exit outer loop if pizza is already destroyed
    }
		
        // Mark the table as unoccupied
        var nearest_table = instance_nearest(x, y, obj_table);
        nearest_table.occupied = false;
        nearest_table.customer_id = noone;
		
		// Calculate total time spent in restaurant
		var total_time = (current_time - entry_time) / 1000;
		show_debug_message("Time spent in restaurant: " + string(total_time));
		
		var money;
		
		if (total_time < 30) {
			money = 20;
		} else if (total_time < 60) {
			money = 10;
		} else {
			money = 2;
		}
		
		obj_controller.player_money += money;
		global.PointsCounter += money;
		
		
    }
}
}