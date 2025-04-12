var _select = -1;

if (!obj_clothing_controller.convo_in_progress) {
		intro_node = "";
	
	if (obj_clothing_controller.just_entered) {
		intro_node = "Start";		
		obj_clothing_controller.just_entered = false;	
		start_conversation(intro_node);
	}
    
    // Check for Scientist 1
    if (obj_clothing_controller.colliding_with_scientist_1) {
        if (obj_clothing_controller.scientist1_correct == 0) {
            intro_node = "Scientist1_IntroA";
        } else if (obj_clothing_controller.scientist1_correct == 1) {
            intro_node = "Scientist1_IntroB";
        } else if (obj_clothing_controller.scientist1_correct == 2) {
            intro_node = "Scientist1_IntroC";
        } else {
            intro_node = "Scientist1_Done";
        }
        start_conversation(intro_node);
    }

    // Check for Scientist 2
    else if (obj_clothing_controller.colliding_with_scientist_2) {
        if (obj_clothing_controller.scientist2_correct == 0) {
            intro_node = "Scientist2_IntroA";
        } else if (obj_clothing_controller.scientist2_correct == 1) {
            intro_node = "Scientist2_IntroB";
        } else if (obj_clothing_controller.scientist2_correct == 2) {
            intro_node = "Scientist2_IntroC";
        } else {
            intro_node = "Scientist2_Done";
        }
        start_conversation(intro_node);
    }

    // Check for Scientist 3
    else if (obj_clothing_controller.colliding_with_scientist_3) {
        if (obj_clothing_controller.scientist3_correct == 0) {
            intro_node = "Scientist3_IntroA";
        } else if (obj_clothing_controller.scientist3_correct == 1) {
            intro_node = "Scientist3_IntroB";
        } else if (obj_clothing_controller.scientist3_correct == 2) {
            intro_node = "Scientist3_IntroC";
        } else {
            intro_node = "Scientist3_Done";
        }
        start_conversation(intro_node);
    }
	
	// Check for mirror conditions
    else if (obj_clothing_controller.colliding_with_mirror && obj_clothing_controller.has_all && !obj_clothing_controller.dressed) {
        intro_node = "Mirror"; start_conversation("Mirror");
    }

    // Check for door
   else if (obj_clothing_controller.colliding_with_door) {
	    if (!obj_clothing_controller.dressed) {
	        intro_node = "Door_Incomplete"; start_conversation("Door_Incomplete");
	    }
	    else {
			/*
	        if (obj_clothing_controller.wear_professional) {
	            start_conversation("Door_Professional");
	        }
	        else if (obj_clothing_controller.wear_swim) {
	            start_conversation("Door_Swim");
	        }
	        else if (obj_clothing_controller.wear_knight) {
	            start_conversation("Door_Knight");
	        }
			*/
			intro_node = "DoorGeneral";
			start_conversation("DoorGeneral");
		}
	}
	
	
		    
}

if (obj_clothing_controller.convo_in_progress) {
	
		
		switch (obj_clothing_controller.conversation_state) {
    
		    // Displaying Text State
		    case "displaying_text":
				
		        text = ChatterboxGetContent(global.chatterbox_clothing, 0);
		        node_title = ChatterboxGetCurrent(global.chatterbox_clothing);
        
				
		        if (ChatterboxIsWaiting(global.chatterbox_clothing)) {
		            obj_clothing_controller.conversation_state = "waiting_for_input";
		        } else if (ChatterboxGetOptionCount(global.chatterbox_clothing)) {
		            obj_clothing_controller.conversation_state = "waiting_for_choice";
		        } else {
		            obj_clothing_controller.conversation_state = "conversation_end";
		        }
		        break;

		    // Waiting for Input State
		    case "waiting_for_input":
		        if (keyboard_check_pressed(vk_space)) {
		            ChatterboxContinue(global.chatterbox_clothing);
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
					ChatterboxSelect(global.chatterbox_clothing, _select - 1);
			        show_debug_message("Processing choice: " + string(_select) + " for node: " + string(node_title));
			       
					alarm[0]=1;
				   
					show_debug_message("ready for ChatterboxSelect");					
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