/// @description Insert description here
// You can write your code in this editor

//Check keys for movement
moveRight = keyboard_check(vk_right);
moveLeft = keyboard_check(vk_left);
moveUp = keyboard_check(vk_up);
moveDown = keyboard_check(vk_down);

//calculate movement
vx = ((moveRight - moveLeft) * walkSpeed);
vy = ((moveDown - moveUp) * walkSpeed);


//if idle
if (vx == 0 && vy == 0 ) {
	
	
}


//if moving
if (vx != 0 || vy != 0) {
    if (!place_meeting(x + vx, y, obj_par_environment)) {
        x += vx;
    }
    
    if (!place_meeting(x, y + vy, obj_par_environment)) {
        y += vy;
    }
}




// Collision checks with fixed radius around the object
var detection_radius = 16; // Adjust radius as needed

obj_clothing_controller.colliding_with_scientist_1 = collision_circle(x, y, detection_radius, obj_scientist_1, true, true);
obj_clothing_controller.colliding_with_scientist_2 = collision_circle(x, y, detection_radius, obj_scientist_2, true, true);
obj_clothing_controller.colliding_with_scientist_3 = collision_circle(x, y, detection_radius, obj_scientist_3, true, true);
obj_clothing_controller.colliding_with_door = collision_circle(x, y, detection_radius+30, obj_clothing_door, true, true);
obj_clothing_controller.colliding_with_mirror = collision_circle(x, y, detection_radius+30, obj_clothing_mirror, true, true);


obj_clothing_controller.colliding_with_book = collision_circle(x, y, detection_radius+64, obj_clothing_book, true, true);
obj_clothing_controller.colliding_with_book1 = collision_circle(x, y, detection_radius+64, obj_clothing_book_1, true, true);
obj_clothing_controller.colliding_with_book2 = collision_circle(x, y, detection_radius+64, obj_clothing_book_2, true, true);
obj_clothing_controller.colliding_with_book3 = collision_circle(x, y, detection_radius+64, obj_clothing_book_3, true, true);
obj_clothing_controller.colliding_with_book4 = collision_circle(x, y, detection_radius+64, obj_clothing_book_4, true, true);
obj_clothing_controller.colliding_with_book5 = collision_circle(x, y, detection_radius+64, obj_clothing_book_5, true, true);
obj_clothing_controller.colliding_with_book6 = collision_circle(x, y, detection_radius+64, obj_clothing_book_6, true, true);
obj_clothing_controller.colliding_with_book7 = collision_circle(x, y, detection_radius+64, obj_clothing_book_7, true, true);
obj_clothing_controller.colliding_with_book8 = collision_circle(x, y, detection_radius+64, obj_clothing_book_8, true, true);
obj_clothing_controller.colliding_with_book9 = collision_circle(x, y, detection_radius+64, obj_clothing_book_9, true, true);
obj_clothing_controller.colliding_with_book10 = collision_circle(x, y, detection_radius+64, obj_clothing_book_10, true, true);


// Initialize the flag if it doesn't already exist
if (!variable_instance_exists(id, "has_crossed_door")) {
   has_crossed_door = false;
}

// Check for collision with obj_clothing_lib_door using collision_circle
if (collision_circle(x, y, 64, obj_clothing_lib_door, false, true)) {
    if (!has_crossed_door) {
        // Check position relative to the door and adjust
        if (x > obj_clothing_lib_door.x) {
            x = obj_clothing_lib_door.x - 164; // Move to the right of the door
        } else {
            x = obj_clothing_lib_door.x + 164; // Move to the left of the door
        }

        // Set the flag to prevent repeated movement
        has_crossed_door = true;
    }
}

// Reset the flag when no longer colliding
if (!collision_circle(x, y, 128, obj_clothing_lib_door, false, true)) {
    has_crossed_door = false;
}


