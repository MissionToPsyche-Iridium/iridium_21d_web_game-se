if (ready_to_seat) {  // Only allow selection if the customer is waiting
    obj_controller.selected_customer = id;  // Set this customer as the selected one
}

if (ready_to_order) {
	customer_pizza = choose("gamma", "neutron");
	show_debug_message("Pizza for " + string(id) + " is of type " + string(customer_pizza));

    receive_order(id, customer_pizza);
	
	// Update state
	ready_to_order = false;
	obj_controller.selected_customer = noone;
	order_taken = true;

// Reset Lula's action state
    obj_lula_pizza.current_action = noone;
    obj_lula_pizza.action_in_progress = false;
}