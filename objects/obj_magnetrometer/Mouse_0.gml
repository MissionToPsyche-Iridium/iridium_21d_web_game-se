if (is_ready && obj_lula_pizza.current_action != "deliver_tool") {
    obj_controller.selected_tool = id;

    // Send Lula to pick up the tool
    with (obj_lula_pizza) {
        current_action = "pick_up_tool";
        target_tool = other.id;
        move_target_x = other.x;
        move_target_y = other.y;
    }
}
