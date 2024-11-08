// Create Event of obj_end
// Load the video file
var video_path = "end_video.mp4";  // Make sure this path points to the correct video file
var video_loaded = video_open(video_path);
if (video_loaded) {
    // Only play the video if it was successfully loaded
    video_play();
} else {
    show_debug_message("Error: Video not loaded!");
}