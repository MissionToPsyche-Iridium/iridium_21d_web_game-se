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

if (occupied && obj_controller.selected_tool != noone) {
    
    // Move Lula to the table
    with (obj_lula_pizza) {
        move_target_x = other.x;
        move_target_y = other.y;
        table_instance = other.instance_name; 
        current_action = "deliver_tool";
    }
}