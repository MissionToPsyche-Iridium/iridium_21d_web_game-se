// Set the text color and alignment
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Define the instructional text
var instructions_text = "Click on a customer to select them, seat them at a table, and serve them pizza!";

// Position the text in the gray area at the top of the screen
var text_x = room_width / 2;
var text_y = 30; // Adjust this value based on how much space you have after resizing the windows

// Draw the text on the screen
draw_text(text_x, text_y, instructions_text);
