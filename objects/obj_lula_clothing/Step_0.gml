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