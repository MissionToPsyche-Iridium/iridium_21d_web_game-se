// Draw Event
var _videoData = video_draw();
var _videoStatus = _videoData[0];

if (_videoStatus == 0) {
    var surface = _videoData[1];
    if (surface != -1) {
        var window_width = window_get_width();
        var window_height = window_get_height();
        var video_width = 1920;
        var video_height = 1080;
        var scale_factor = min(window_width / video_width, window_height / video_height);
        var scaled_width = video_width * scale_factor;
        var scaled_height = video_height * scale_factor;
        var x_pos = (window_width - scaled_width) / 2;
        var y_pos = (window_height - scaled_height) / 2;
        draw_surface_ext(surface, x_pos, y_pos, scale_factor, scale_factor, 0, c_white, 1);
        
        // Add text for skipping instructions
        var text = "Press Escape or Space to Skip";
        var text_x = window_width / 2 - string_width(text) / 2;
        var text_y = window_height - 50;
        
        draw_set_color(c_white);
        draw_set_font(fnt_skip_message);  // Ensure this matches the name of the font resource
        draw_text(text_x, text_y, text);
    }
}
