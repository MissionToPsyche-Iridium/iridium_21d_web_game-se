// Step Event of obj_end

if (video_get_status() == 3)  // 3 represents video_status_done
{
    video_close();  // Close the video when done
    room_goto_next();  // Go to the next room when the video finishes
}
