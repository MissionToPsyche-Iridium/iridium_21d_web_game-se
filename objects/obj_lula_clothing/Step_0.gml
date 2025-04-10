// === MOVEMENT INPUT ===
var moveRight = keyboard_check(vk_right);
var moveLeft  = keyboard_check(vk_left);
var moveUp    = keyboard_check(vk_up);
var moveDown  = keyboard_check(vk_down);

var vx = (moveRight - moveLeft) * walkSpeed;
var vy = (moveDown - moveUp) * walkSpeed;

// === MOVEMENT COLLISION (USING instance_place FOR HTML5 SPEED) ===
if (vx != 0 || vy != 0) {
    var bump_x = instance_place(x + vx, y, obj_par_environment);
    if (bump_x == noone) bump_x = instance_place(x + vx, y, obj_par_interactable);
    if (bump_x == noone || bump_x.object_index == obj_clothing_lib_door) {
        x += vx;
    }

    var bump_y = instance_place(x, y + vy, obj_par_environment);
    if (bump_y == noone) bump_y = instance_place(x, y + vy, obj_par_interactable);
    if (bump_y == noone || bump_y.object_index == obj_clothing_lib_door) {
        y += vy;
    }
}

// === RESET COLLISION FLAGS ON CONTROLLER ===
with (obj_clothing_controller) {
    colliding_with_scientist_1 = false;
    colliding_with_scientist_2 = false;
    colliding_with_scientist_3 = false;
    colliding_with_door        = false;
    colliding_with_mirror      = false;
    colliding_with_book        = false;
    colliding_with_book1       = false;
    colliding_with_book2       = false;
    colliding_with_book3       = false;
    colliding_with_book4       = false;
    colliding_with_book5       = false;
    colliding_with_book6       = false;
    colliding_with_book7       = false;
    colliding_with_book8       = false;
    colliding_with_book9       = false;
    colliding_with_book10      = false;
}

// === PROXIMITY DETECTION FOR INTERACTABLES (ONLY WHEN MOVING) ===
if (vx != 0 || vy != 0) {
    var interact = collision_circle(x, y, 64, obj_par_interactable, false, true);
    if (interact != noone) {
        var obj_id = interact.object_index;
        with (obj_clothing_controller) {
            switch (obj_id) {
                case obj_scientist_1:      colliding_with_scientist_1 = true; break;
                case obj_scientist_2:      colliding_with_scientist_2 = true; break;
                case obj_scientist_3:      colliding_with_scientist_3 = true; break;
                case obj_clothing_book:    colliding_with_book        = true; break;
                case obj_clothing_book_1:  colliding_with_book1       = true; break;
                case obj_clothing_book_2:  colliding_with_book2       = true; break;
                case obj_clothing_book_3:  colliding_with_book3       = true; break;
                case obj_clothing_book_4:  colliding_with_book4       = true; break;
                case obj_clothing_book_5:  colliding_with_book5       = true; break;
                case obj_clothing_book_6:  colliding_with_book6       = true; break;
                case obj_clothing_book_7:  colliding_with_book7       = true; break;
                case obj_clothing_book_8:  colliding_with_book8       = true; break;
                case obj_clothing_book_9:  colliding_with_book9       = true; break;
                case obj_clothing_book_10: colliding_with_book10      = true; break;
            }
        }
    }
}

// === ADDITIONAL PROXIMITY CHECK FOR DOOR / MIRROR ===
var env = collision_circle(x, y, 16, obj_par_environment, false, true);
if (env != noone) {
    var env_id = env.object_index;
    with (obj_clothing_controller) {
        if (env_id == obj_clothing_door)   colliding_with_door   = true;
        if (env_id == obj_clothing_mirror) colliding_with_mirror = true;
    }
}

// === TELEPORTATION LOGIC FOR obj_clothing_lib_door ===
if (collision_circle(x, y, 64, obj_clothing_lib_door, false, true)) {
    if (!has_crossed_door) {
        if (x > obj_clothing_lib_door.x) {
            x = obj_clothing_lib_door.x - 128;
        } else {
            x = obj_clothing_lib_door.x + 128;
        }
        has_crossed_door = true;
    }
}

// === Reset teleport flag when far enough from door ===
if (!collision_circle(x, y, 128, obj_clothing_lib_door, false, true)) {
    has_crossed_door = false;
}
