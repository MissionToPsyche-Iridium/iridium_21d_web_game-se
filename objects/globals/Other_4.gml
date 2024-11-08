/// @description Insert description here
// You can write your code in this editor


global.default_width = 720;
global.default_height = 720;

global.new_width = 0;
global.new_height = 0;

if (room == room_clothing) {
    global.new_width = 1280;
    global.new_height = 720;
} else {
    global.new_width = global.default_width;
    global.new_height = global.default_height;
}

window_set_size(global.new_width, global.new_height);
surface_resize(application_surface, global.new_width, global.new_height);

camera_set_view_size(view_camera[0], global.new_width, global.new_height);
camera_set_view_pos(view_camera[0], 0, 0);

view_set_wport(0, global.new_width);
view_set_hport(0, global.new_height);

window_center();
