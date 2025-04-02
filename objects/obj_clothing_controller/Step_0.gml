/// @description Insert description here
// You can write your code in this editor

/*
if (clothing_from_s1=2) {has_all_from_s1 = true;}
if (clothing_from_s2=2) {has_all_from_s2 = true;}
if (clothing_from_s3=2) {has_all_from_s3 = true;}

*/

if (obj_clothing_controller.intro_counter > 0) {
	obj_clothing_controller.intro_counter--;
}

else {obj_clothing_controller.intro = false;}

if (has_all_from_s1 && has_all_from_s2 && has_all_from_s3) has_all = true;

if (obj_clothing_controller.ready_for_results_1) {
    if (obj_clothing_controller.wait_timer > 0) {
        obj_clothing_controller.wait_timer--; // Countdown each frame
    } else {
       obj_clothing_controller.ready_for_results_1 = false;
	   obj_clothing_controller.ready_for_results_2 = true;
	   obj_clothing_controller.wait_timer = 360;
    }
}

if (obj_clothing_controller.ready_for_results_2) {
    if (obj_clothing_controller.wait_timer > 0) {
        obj_clothing_controller.wait_timer--; // Countdown each frame
    } else {
		
		if (global.mode == "story") {
		audio_stop_all();
        room_goto_next(); // Only go to the next room when timer hits 0
		}
		
		else {audio_stop_all(); room_goto(room_intro);}
    }
}
