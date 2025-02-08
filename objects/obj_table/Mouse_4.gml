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
    // Get the selected tool instance
    var selected_tool = obj_controller.selected_tool;
    
    // Check if the selected tool instance matches the customer's required tool
    if (instance_exists(selected_tool) && instance_exists(customer_id)) {
        // Move the tool to the table's position
        selected_tool.x = x + 50;  // Align the tool to the table's position
        selected_tool.y = y + 10;

        // Start the customer using the tool
        var customer = instance_nearest(x, y, obj_customer);
        if (instance_exists(customer)) {
            customer.ready_to_use_tool = true;
            customer.using_tool_timer = 300;  // Set tool usage duration
        }

        // Clear the selected tool
        obj_controller.selected_tool = noone;
        show_debug_message("Correct tool delivered to the customer.");
    } else {
        show_debug_message("This tool doesn't match the customer's request or no longer exists.");
    }
}
