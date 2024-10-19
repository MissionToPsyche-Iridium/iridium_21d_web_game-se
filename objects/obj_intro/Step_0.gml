if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_space)) {
    video_close();
    room_goto_next();
}
