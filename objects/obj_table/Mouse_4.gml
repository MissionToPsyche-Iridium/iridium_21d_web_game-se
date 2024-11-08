if (!occupied && obj_controller.selected_customer != noone) {
    // Seat the selected customer at this table
    customer_id = obj_controller.selected_customer;

    // Check if the selected customer instance is still valid
    if (instance_exists(customer_id)) {
        // Set the customer’s X and Y based on the table’s position
        customer_id.x = x - 20;  // Align customer’s X with the table’s X
        customer_id.y = y + 60;  // Offset Y position so the customer appears below the table

        // Mark the table as occupied and set the customer as ready to order
        occupied = true;
        customer_id.seated = true;

        // Clear the selected customer
        obj_controller.selected_customer = noone;
    } else {
        show_debug_message("Selected customer no longer exists.");
    }
}

if (occupied && obj_controller.selected_pizza != noone) {
    // Get the selected pizza instance
    var selected_pizza = obj_controller.selected_pizza;
    
    // Check if the selected pizza instance is valid and matches the customer's ID
    if (instance_exists(selected_pizza) && instance_exists(customer_id) && selected_pizza.customer_id == customer_id) {
        // Clear pizza from plate on counter
        var plate_found = noone;
        for (var i = 0; i < array_length(global.plates); i++) {
            if (global.plates[i].pizza_instance == selected_pizza) {
                plate_found = global.plates[i];
                break;
            }
        }
        
        if (plate_found != noone) {
            plate_found.occupied = false;  // Mark plate as free
            //plate_found.pizza_instance = noone;  // Remove pizza reference
            plate_found.delivered = true;  // Mark this plate's pizza as delivered
        }
        
        // Move the pizza to the table's position
        selected_pizza.x = x + 50;  // Align the pizza to the table's position
        selected_pizza.y = y + 10;

        // Start the customer eating state
        var customer = instance_nearest(x, y, obj_customer);
        if (instance_exists(customer)) {
            customer.ready_to_eat = true;
            customer.eating_timer = 300;  // Set eating duration
        }

        // Remove the specific order from the order queue after delivery
        for (var j = 0; j < array_length(obj_chef.order_queue); j++) {
            if (obj_chef.order_queue[j].customer_id == customer_id) {
                array_delete(obj_chef.order_queue, j, 1);  // Remove the specific order
                break;
            }
        }
        
        // Mark the table as having the pizza delivered
        obj_controller.selected_pizza = noone;  // Clear the selected pizza
        show_debug_message("Pizza delivered to the correct customer.");
    } else {
		obj_controller.selected_pizza = noone;  // Clear the selected pizza
        show_debug_message("This pizza doesn't belong to the customer at this table or no longer exists.");
    }
}
