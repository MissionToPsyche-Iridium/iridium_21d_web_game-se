// Check if the game is paused
if (global.gamepaused) {
    return;  // Pause the game logic
}


// Change sprite for direction
if(move_target_x > x && !move_right) {
    image_xscale = -1;
    move_right = true;
} else if (move_target_x < x && move_right) { 
    image_xscale = 1;
    move_right = false;
}

// Movement Logic for Customer Orders
if (current_action == "move_to_customer") {
    if (move_target_x != -1 && move_target_y != -1) {
        
        
        if (initial_movement) {
                    // Determine the path dynamically based on table instance
                    var path_name = "Path_" + table_instance;
                    var target_path = asset_get_index(path_name);
        
                    if (path_to_follow != -1) {
                        path_start(target_path, move_speed, path_action_stop, false);
                        path_active = true;
                    } else {
                        show_debug_message(string(table_instance));
                    }
                } else {
			move_speed = 4;
            
			if (mp_grid_path(global.nav_grid, path, x, y, move_target_x + 50, move_target_y - 50, true)) {
                show_debug_message("Lula: Path found to (" + string(move_target_x) + ", " + string(move_target_y) + ")");
                path_start(path, move_speed, path_action_stop, false);
                path_active = true;
            } else {
                show_debug_message("Lula: No valid path found!");
            }
        }


        // Check if Lula has reached the target
        if (path_active && point_distance(x, y, move_target_x + 50, move_target_y - 50) < 5) {
			path_end(); // Stop path following
            path_active = false;
            x = move_target_x + 50;  // Snap to the target x
            y = move_target_y - 50;  // Snap to the target y
            move_target_x = -1; // Reset target x
            move_target_y = -1; // Reset target y
            speed = 0;
            current_action = "take_order";
        }
    }
}

// Taking Order
if (target_customer != noone && current_action == "take_order") {
    with (target_customer) {
        if (ready_to_order) {
            switch (object_index) {
                case obj_bell:
                    scientist_tool = "multispectral";
                    break;
                case obj_lawrence:
					scientist_tool = choose("neutron", "gamma");
					break;
                case obj_brauer:
                    scientist_tool = "magnetrometer";
                    break;
                case obj_zuber:
                    scientist_tool = choose("DSOC", "radio");
                    break;
                default:
                    show_debug_message("Wrong object index indicated");
                    break;
            }
            customer_tool = "spr_" + scientist_tool;
            ready_to_order = false;
            receive_order(id, scientist_tool);
            
            obj_controller.selected_customer = noone;
            order_taken = true;
        }
    }
    target_customer = noone;
    current_action = "idle";
}

// Picking up the tool
if (current_action == "pick_up_tool") {
    if (move_target_x != -1 && move_target_y != -1) {
       
        move_speed = 4;
        if (mp_grid_path(global.nav_grid, path, x, y, move_target_x, move_target_y - 100, false)) {
            path_start(path, move_speed, path_action_stop, false);
            path_active = true;
        } else {
            show_debug_message("Lula: No valid path to tool found!");
        }

        // Check if Lula has reached the tool
        if (path_active && point_distance(x, y, move_target_x, move_target_y - 100) < 5) {
            path_end();
            path_active = false;
            x = move_target_x;
            y = move_target_y - 100;
            move_target_x = -1;
            move_target_y = -1;
            speed = 0;

            // Picking up the tool
            if (target_tool != noone) {
                with (target_tool) {
                    if (is_ready) {
                        obj_controller.selected_tool = id;
                        scientist_tool = object_get_name(object_index);
                        show_debug_message("Tool picked up: " + scientist_tool);
                        
						// Attach the tool to Lula
                        tool_attached = instance_create_layer(x, y - 10, "Instances", object_index);
						
                        // Mark plate as free immediately
                        var plate_found = noone;
                        for (var i = 0; i < array_length(global.plates); i++) {
                            if (global.plates[i].tool_instance == id) {
                                plate_found = global.plates[i];
                                break;
                            }
                        }

                        if (plate_found != noone) {
                            plate_found.delivered = true;
                            //show_debug_message("Tool removed from plate: " + string(plate_found));
                        }

                        if (instance_exists(tool_attached)) {
							tool_attached.attached_to_lula = true; // New variable to track attachment
							tool_attached.lula_id = other.id; // Store Lula's ID
							tool_attached.tool_name = scientist_tool; // Store the tool's name
							show_debug_message("CURRENT TOOL TO DELIVER: " + object_get_name(tool_attached.object_index));	
						}
                    }
                }
            }

            target_tool = noone;
            current_action = "idle";
        }
    }
}

// Deliver the tool once Lula reaches the table
if (current_action == "deliver_tool") {
    if (move_target_x != -1 && move_target_y != -1) {
        if (!path_active) {
            move_speed = 4;
            
            if (mp_grid_path(global.nav_grid, path, x, y, move_target_x + 25, move_target_y + 25, false)) {
                path_start(path, move_speed, path_action_stop, false);
                path_active = true;
            } else {
                show_debug_message("Lula: No valid path to table found!");
            }
        }
    
        // Check if Lula has reached the target table
        if (path_active && point_distance(x, y, move_target_x + 25, move_target_y + 25) < 5) {
            path_end();
            path_active = false;
            x = move_target_x + 25;
            y = move_target_y + 25;
            move_target_x = -1;
            move_target_y = -1;
            speed = 0;

            var matching = true; //change later once issues resolved
            var customer = instance_nearest(x, y, obj_customer);
            var tool = instance_nearest(x, y, obj_tool);


            //Check if the tool matches the customer's request
            if (instance_exists(customer) && instance_exists(tool)) {
                show_debug_message("line 149 in step event lula");
                tool.customer_id = customer.id;
                //switch (customer.object_index) {
                //    case obj_bell:
                //        matching = (tool_attached.tool_name == "multispectral");
                //        break;
                //    case obj_lawrence:
                //        matching = (tool_attached.tool_name == "neutron" || tool_attached.tool_name == "gamma");
                //        break;
                //    case obj_brauer:
                //        matching = (tool_attached.tool_name == "magnetometer");
                //        break;
                //    case obj_zuber:
                //        matching = (tool_attached.tool_name == "DSOC" || tool_attached.tool_name == "radio");
                //        break;
                //    default:
                //        show_debug_message("Wrong object index indicated");
                //        break;
                //}

            

                    // Deliver tool
                    tool.attached_to_lula = false;
                    tool.tool_delivery_ready = true;
                    customer.ready_to_eat = true;
                    
                    // Clear the selected tool
                    obj_controller.selected_tool = noone;
                    instance_destroy(tool);
                
            }
            
            current_action = "idle";
        }
        
    }
}