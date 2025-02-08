if (is_ready) {
		// Set the tool as the selected tool
    obj_controller.selected_tool = id;

    // Send Lula to pick up the tool
    with (obj_lula_pizza) {
        current_action = "pick_up_tool";
        target_tool = id;
        move_target_x = other.x;  // Set the target position to the tool's position
        move_target_y = other.y;
    }
}