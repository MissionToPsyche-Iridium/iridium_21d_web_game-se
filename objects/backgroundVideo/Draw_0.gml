// Retrieve the video data and playback status
var _videoData = video_draw();  
var _videoStatus = _videoData[0];  

if (_videoStatus == 0) {  // If the video is playing correctly
    var surface = _videoData[1];  

    if (surface != -1) {
        // Get the current window dimensions
        var window_width = window_get_width();
        var window_height = window_get_height();
        
        // Draw a white background covering the entire window
		draw_set_colour(c_black);
        draw_rectangle(0, 0, window_width, window_height, false);
        
        // Get the actual dimensions of the video surface
        var video_width = surface_get_width(surface);
        var video_height = surface_get_height(surface);
        
        // Calculate scaling factors to maintain the aspect ratio
        var scale_factor = min(window_width / video_width, window_height / video_height);
        
        // Calculate scaled dimensions and center the video in the window
        var scaled_width = video_width * scale_factor;
        var scaled_height = video_height * scale_factor;
        
        var x_pos = (window_width - scaled_width) / 2;
        var y_pos = (window_height - scaled_height) / 2;
        
        // Draw the video surface, scaled and centered
        draw_surface_ext(surface, x_pos, y_pos, scale_factor, scale_factor, 0, c_white, 1);
    }
}
