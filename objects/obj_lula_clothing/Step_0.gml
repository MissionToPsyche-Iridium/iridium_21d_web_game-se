/// @description Optimized Step Event for HTML5

// Movement input
var moveRight = keyboard_check(vk_right);
var moveLeft  = keyboard_check(vk_left);
var moveUp    = keyboard_check(vk_up);
var moveDown  = keyboard_check(vk_down);

// Velocity calculation
var vx = (moveRight - moveLeft) * walkSpeed;
var vy = (moveDown - moveUp) * walkSpeed;

// Movement with collision
if (vx != 0 || vy != 0) {
    if (!place_meeting(x + vx, y, obj_par_environment)) {
        x += vx;
    }
    if (!place_meeting(x, y + vy, obj_par_environment)) {
        y += vy;
    }
}

// --- INTERACTION LOGIC ---

var detection_radius = 64; // Set to max needed radius
var nearest = noone;
var min_dist = detection_radius;

with (obj_clothing_parent) {
    var dist = point_distance(x, y, other.x, other.y);
    if (dist < min_dist) {
        nearest = id;
        min_dist = dist;
    }
}

// Reset interaction flags
with (obj_clothing_controller) {
    colliding_with = "";
}

// If something is nearby, set appropriate flag
if (nearest != noone) {
    with (obj_clothing_controller) {
        colliding_with = nearest.interact_type;
    }

    // Optional: Do something immediately based on type
    switch (nearest.interact_type) {
        case "scientist1":
            // Show text or do something
            break;
        case "mirror":
            // Mirror interaction logic
            break;
        case "door":
            // Door-specific logic
            break;
    }
}

// --- DOOR TELEPORT LOGIC ---

// Initialize the flag if not set
if (!variable_instance_exists(id, "has_crossed_door")) {
   has_crossed_door = false;
}

var door = instance_nearest(x, y, obj_clothing_lib_door);
if (door != noone && point_distance(x, y, door.x, door.y) < 64) {
    if (!has_crossed_door) {
        if (x > door.x) {
            x = door.x - 164;
        } else {
            x = door.x + 164;
        }
        has_crossed_door = true;
    }
}

// Reset flag when far enough
if (door != noone && point_distance(x, y, door.x, door.y) > 128) {
    has_crossed_door = false;
}
