if (keyboard_check_pressed(ord("Q"))) {
    video_close();
    room_goto(room_start);  // Use the room variable directly
}
