if (array_length(order_queue) > 0) {
    var current_order = order_queue[0];  // Get the first order in the queue

    // Simulate preparation time by waiting for a certain period
    preparation_timer -= 1;

    // Find the next available plate
    var available_plate = noone;
    for (var i = 0; i < array_length(global.plates); i++) {
        if (!global.plates[i].occupied) {
            available_plate = global.plates[i];
            break;
        }
    }

    // Proceed with pizza preparation only if a plate is available
    if (available_plate != noone && preparation_timer <= 0) {
        // Reset the preparation timer for the next pizza
        preparation_timer = 300;  // Adjust as needed for preparation time
        
        // Create the pizza at the available plate's position
        var pizza_object = asset_get_index("obj_" + current_order.pizza_id);
        var pizza_instance = instance_create_layer(available_plate.x, available_plate.y, "Instances", pizza_object);
		show_debug_message("Creating pizza at x: " + string(available_plate.x) + " y: " + string(available_plate.y));

        // Assign customer_id to the pizza for tracking
        pizza_instance.customer_id = current_order.customer_id;
        pizza_instance.is_ready = true;
        
        // Mark the plate as occupied and link the pizza to the plate
        available_plate.occupied = true;
        available_plate.pizza_instance = pizza_instance;

        // Remove the order from the queue after placing it on a plate
        array_delete(order_queue, 0, 1);
        
        show_debug_message("Pizza ready for customer: " + string(current_order.customer_id));
    }
}
