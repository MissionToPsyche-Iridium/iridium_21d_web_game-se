// Check if the game is paused
if (global.gamepaused) {
    return;  // Pause the game logic
}

var scientist_tool = "";
// Movement Logic
if (current_action == "move_to_customer") {
if (move_target_x != -1 && move_target_y != -1) {
	show_debug_message("Lula Position: (" + string(x) + ", " + string(y) + ")");
    show_debug_message("Current Action: " + current_action);
    show_debug_message("Target Customer: " + string(target_customer));
    show_debug_message("Move Target: (" + string(move_target_x) + ", " + string(move_target_y) + ")");
    // Move toward the target point
	move_speed = 3;
    move_towards_point(move_target_x + 50, move_target_y - 50, move_speed);

    // Check if Lula has reached the target
    if (point_distance(x, y, move_target_x + 50, move_target_y - 50) < 5) {
        x = move_target_x + 50;  // Snap to the target x
        y = move_target_y - 50;  // Snap to the target y
        move_target_x = -1; // Reset target x
        move_target_y = -1; // Reset target y
		speed = 0;
		current_action = "take_order";
		show_debug_message("WE DID THIS PART SUCCESSFULLY");
    }}
	
	
	if (target_customer != noone && current_action == "take_order") {
                // Interact with the customer to take their order
                with (target_customer) {
                    if (ready_to_order) {
						switch (object_index) {
							case obj_bell:
							scientist_tool = "multispectral";
							break;
							
							case obj_brauer:
							scientist_tool = "magnetrometer";
							break;
							
							case obj_lawrence:
							scientist_tool = "magnetrometer";
							break;
							
							case obj_zuber:
							scientist_tool = choose("DSOC", "radio");
							break;
							
							default:
							show_debug_message("Wrong object index indicated");
							break;
						}
						
                        ready_to_order = false;
						
						receive_order(id, scientist_tool);
						
						obj_controller.selected_customer = noone;
						order_taken = true;
                    }
                }
                target_customer = noone;  // Reset customer target
                current_action = "idle";  // Reset Lula's action
    }
	show_debug_message("Lula Position: (" + string(x) + ", " + string(y) + ")");
    show_debug_message("Current Action: " + current_action);
    show_debug_message("Target Customer: " + string(target_customer));
    show_debug_message("Move Target: (" + string(move_target_x) + ", " + string(move_target_y) + ")");
}

// Logic for picking up the tool
if (current_action == "pick_up_tool") {
    if (move_target_x != -1 && move_target_y != -1) {
        //show_debug_message("Lula Position: (" + string(x) + ", " + string(y) + ")");
        //show_debug_message("Current Action: " + current_action);
        //show_debug_message("Target Tool: " + string(target_tool));
        //show_debug_message("Move Target: (" + string(move_target_x) + ", " + string(move_target_y) + ")");
        // Move toward the tool
        move_speed = 3;
        move_towards_point(move_target_x, move_target_y - 100, move_speed);

        // Check if Lula has reached the tool
        if (point_distance(x, y, move_target_x, move_target_y - 100) < 5) {
            x = move_target_x;  // Snap to the tool's x
            y = move_target_y - 100;  // Snap to the tool's y
            move_target_x = -1; // Reset target x
            move_target_y = -1; // Reset target y
            speed = 0;

            // Logic to "pick up" the tool
            if (target_tool != noone) {
                with (target_tool) {
                    
                   
                }
            }

            target_tool = noone; // Reset tool target
            current_action = "idle"; // Reset Lula's action
            show_debug_message("Tool picked up successfully!");
        }
    }
}