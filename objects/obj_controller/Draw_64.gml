// Display player money
draw_set_color(c_fuchsia);
//draw_set_font(font_large);
draw_text_transformed(room_width - 125, room_height - 62, "$" + string(player_money), 2, 2, 0);

if (global.gamepaused) {
    draw_set_color(c_white);
	draw_text_transformed(room_width / 2 - 50, room_height / 2, "Paused", 2, 2, 0); 
    draw_set_color(c_black);  // Reset color to default
}