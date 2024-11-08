// Check if the video file exists
if (file_exists("intro_video.mp4")) {
    var video_loaded = video_open("intro_video.mp4");  // Attempt to open the video
    if (video_loaded) {
        video_set_volume(1.0);  // Set volume to full
        video_play();  // Play the video only if it was loaded successfully
    }
} else {
    show_message("Video file not found!");  // Handle missing video file
}
is_video_playing = true;  // Set flag indicating the video is playing