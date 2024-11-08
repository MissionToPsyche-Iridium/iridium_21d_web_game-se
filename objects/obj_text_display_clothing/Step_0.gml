var _select = -1;

if (!obj_clothing_controller.convo_in_progress) {
    // Check for Scientist 1
    if (obj_clothing_controller.colliding_with_scientist_1 && !obj_clothing_controller.has_briefcase) {
        start_conversation("Scientist1_Briefcase");
    }
    else if (obj_clothing_controller.colliding_with_scientist_1 && obj_clothing_controller.has_briefcase && !obj_clothing_controller.has_cravate) {
        start_conversation("Scientist1_Cravate");
    }
    else if (obj_clothing_controller.colliding_with_scientist_1 && obj_clothing_controller.has_briefcase && obj_clothing_controller.has_cravate && !obj_clothing_controller.has_monocle) {
        start_conversation("Scientist1_Monocle");
    }
    else if (obj_clothing_controller.colliding_with_scientist_1 && obj_clothing_controller.has_briefcase && obj_clothing_controller.has_cravate && obj_clothing_controller.has_monocle) {
        start_conversation("Scientist1_Done");
    }

    // Check for Scientist 2
    else if (obj_clothing_controller.colliding_with_scientist_2 && !obj_clothing_controller.has_goggles) {
        start_conversation("Scientist2_Goggles");
    }
    else if (obj_clothing_controller.colliding_with_scientist_2 && obj_clothing_controller.has_goggles && !obj_clothing_controller.has_snorkel) {
        start_conversation("Scientist2_Snorkel");
    }
    else if (obj_clothing_controller.colliding_with_scientist_2 && obj_clothing_controller.has_goggles && obj_clothing_controller.has_snorkel && !obj_clothing_controller.has_floaties) {
        start_conversation("Scientist2_Floaties");
    }
    else if (obj_clothing_controller.colliding_with_scientist_2 && obj_clothing_controller.has_goggles && obj_clothing_controller.has_snorkel && obj_clothing_controller.has_floaties) {
        start_conversation("Scientist2_Done");
    }

    // Check for Scientist 3 
    else if (obj_clothing_controller.colliding_with_scientist_3 && !obj_clothing_controller.has_helm) {
        start_conversation("Scientist3_Helm");
    }
    else if (obj_clothing_controller.colliding_with_scientist_3 && obj_clothing_controller.has_helm && !obj_clothing_controller.has_armor) {
        start_conversation("Scientist3_Armor");
    }
    else if (obj_clothing_controller.colliding_with_scientist_3 && obj_clothing_controller.has_helm && obj_clothing_controller.has_armor && !obj_clothing_controller.has_boots) {
        start_conversation("Scientist3_Boots");
    }
    else if (obj_clothing_controller.colliding_with_scientist_3 && obj_clothing_controller.has_helm && obj_clothing_controller.has_armor && obj_clothing_controller.has_boots) {
        start_conversation("Scientist3_Done");
    }
	
	// Check for mirror conditions
    else if (obj_clothing_controller.colliding_with_mirror && obj_clothing_controller.has_all && !obj_clothing_controller.dressed) {
        start_conversation("Mirror");
    }

    // Check for door
   else if (obj_clothing_controller.colliding_with_door) {
	    if (!obj_clothing_controller.dressed) {
	        start_conversation("Door_Incomplete");
	    }
	    else {
	        if (obj_clothing_controller.wear_professional) {
	            start_conversation("Door_Professional");
	        }
	        else if (obj_clothing_controller.wear_swim) {
	            start_conversation("Door_Swim");
	        }
	        else if (obj_clothing_controller.wear_knight) {
	            start_conversation("Door_Knight");
	        }
		}
	}    
    
}

if (obj_clothing_controller.convo_in_progress) {
	
		show_debug_message("Start of convo in progress switch state" + obj_clothing_controller.conversation_state);
		switch (obj_clothing_controller.conversation_state) {
    
		    // Displaying Text State
		    case "displaying_text":
				show_debug_message("inside displaying text case");
		        text = ChatterboxGetContent(chatterbox, 0);
		        node_title = ChatterboxGetCurrent(chatterbox);
        
		        if (ChatterboxIsWaiting(chatterbox)) {
		            obj_clothing_controller.conversation_state = "waiting_for_input";
		        } else if (ChatterboxGetOptionCount(chatterbox)) {
		            obj_clothing_controller.conversation_state = "waiting_for_choice";
		        } else {
		            obj_clothing_controller.conversation_state = "conversation_end";
		        }
		        break;

		    // Waiting for Input State
		    case "waiting_for_input":
		        if (keyboard_check_pressed(vk_space)) {
		            ChatterboxContinue(chatterbox);
		            obj_clothing_controller.conversation_state = "displaying_text";
		        }
		        break;

		    // Waiting for Choice State
		    case "waiting_for_choice":
			    if (keyboard_check_released(ord("1"))) {
			        _select = 1;
			        show_debug_message("Choice 1 selected.");
					
			    }
			    if (keyboard_check_released(ord("2"))) {
			        _select = 2;
			        show_debug_message("Choice 2 selected.");
					
			    }
			    if (keyboard_check_released(ord("3"))) {
			        _select = 3;
			        show_debug_message("Choice 3 selected.");
					
			    }

			    if (_select != -1) {
			        show_debug_message("Processing choice: " + string(_select) + " for node: " + string(node_title));
			        process_choice(node_title, _select); // Call the choice-processing script
					ChatterboxSelect(chatterbox, _select - 1)
			        _select = -1;
					
					
		           
					
			        obj_clothing_controller.conversation_state = "displaying_text";
					show_debug_message("Set back to displaying text");
			    }
			    break;

		    // Conversation End State
		    case "conversation_end":
				show_debug_message("conversation ended");
		        obj_clothing_controller.convo_in_progress = false;
		        obj_clothing_controller.conversation_state = "initial"; // Reset for next interaction
		        break;
		}

}

if (obj_clothing_controller.has_all_from_s1 && obj_clothing_controller.has_all_from_s2 && obj_clothing_controller.has_all_from_s3) obj_clothing_controller.has_all = true;