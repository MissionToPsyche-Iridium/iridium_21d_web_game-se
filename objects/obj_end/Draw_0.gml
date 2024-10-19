var _videoData = video_draw();  // Process the video and retrieve the surface
var _videoStatus = _videoData[0];  // Get the playback status

if (_videoStatus == 0) {  // If the video is playing correctly
    var surface = _videoData[1];  // Get the video surface
    if (surface != -1) {
        // Get window dimensions
        var window_width = window_get_width();
        var window_height = window_get_height();
        
        // Video's original width and height (adjust to match your video)
        var video_width = 1920;
        var video_height = 1080;
        
        // Calculate scaling to fit the window
        var scale_factor = min(window_width / video_width, window_height / video_height);
        var scaled_width = video_width * scale_factor;
        var scaled_height = video_height * scale_factor;
        
        // Center the video on the screen
        var x_pos = (window_width - scaled_width) / 2;
        var y_pos = (window_height - scaled_height) / 2;
        
        // Draw the video surface
        draw_surface_ext(surface, x_pos, y_pos, scale_factor, scale_factor, 0, c_white, 1);
        
        // Draw the skip message
        var text = "Congratulations!!!!";
        var text_x = window_width / 2 - string_width(text) / 2;
        var text_y = window_height - 50;
        
        draw_set_color(c_white);
        draw_text(text_x, text_y, text);
    }
}
