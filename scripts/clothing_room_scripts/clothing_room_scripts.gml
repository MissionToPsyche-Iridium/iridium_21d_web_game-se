// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function start_conversation(_node_title) {    
    ChatterboxJump(chatterbox, _node_title);
    obj_clothing_controller.convo_in_progress = true;
    obj_clothing_controller.conversation_state = "displaying_text";
}

function process_choice(_node_title, _choice) {
	show_debug_message("process_choice script active");
	
    switch (_node_title) {
    
        // Scientist 1 Nodes
        case "Scientist1_Briefcase":
            if (_choice == 1){obj_clothing_controller.has_briefcase = true;}
			addPoints(10);
            break;
            
        case "Scientist1_Cravate":
            if (_choice == 1) {obj_clothing_controller.has_cravate = true; addPoints(10);}
            break;
            
        case "Scientist1_Monocle":
            if (_choice == 1) {
                obj_clothing_controller.has_monocle = true; addPoints(10);
                obj_clothing_controller.has_all_from_s1 = true; addPoints(10);
            }
            break;
        
        // Scientist 2 Nodes
        case "Scientist2_Goggles":
            if (_choice == 1) {obj_clothing_controller.has_goggles = true; addPoints(10);}
            break;
            
        case "Scientist2_Snorkel":
            if (_choice == 1) {obj_clothing_controller.has_snorkel = true; addPoints(10);}
            break;
            
        case "Scientist2_Floaties":
            if (_choice == 1) {
                obj_clothing_controller.has_floaties = true; addPoints(10);
                obj_clothing_controller.has_all_from_s2 = true; addPoints(10);
            }
            break;

        // Scientist 3 Nodes
        case "Scientist3_Helm":
            if (_choice == 1) {obj_clothing_controller.has_helm = true; addPoints(10);}
            break;
            
        case "Scientist3_Armor":
            if (_choice == 1) {obj_clothing_controller.has_armor = true; addPoints(10);}
            break;
            
        case "Scientist3_Boots":
            if (_choice == 1) {
                obj_clothing_controller.has_boots = true; addPoints(10);
                obj_clothing_controller.has_all_from_s3 = true; addPoints(10);
            }
            break;

        // Door Nodes
        case "Door_Professional":
            if (_choice == 1) room_goto_next(); 
            break;

        case "Door_Swim":
            if (_choice == 1) room_goto_next(); 
            break;

        case "Door_Knight":
            if (_choice == 1) room_goto_next(); 
            break;

        // Mirror Node
        case "Mirror":
            if (_choice == 1) {obj_clothing_controller.wear_professional = true; 
			addPoints(100);}
            else if (_choice == 2) obj_clothing_controller.wear_swim = true;
            else if (_choice == 3) obj_clothing_controller.wear_knight = true;
			
			if (_choice == 1 || _choice == 2 || _choice ==3) obj_clothing_controller.dressed = true;
            break;
        
        
    }
}
