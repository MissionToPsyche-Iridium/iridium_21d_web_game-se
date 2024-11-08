// Display player money
draw_set_color(c_fuchsia);
//draw_set_font(font_large);
draw_text_transformed(room_width - 125, room_height - 62, "$" + string(player_money), 2, 2, 0);

if (global.gamepaused) {
    draw_set_color(c_white);
	draw_text_transformed(room_width / 2 - 50, room_height / 2, "Paused", 2, 2, 0); 
    draw_set_color(c_black);  // Reset color to default
}

if (game_over) {
// Display "You Win!" message and total score
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var win_text = "You Win!";
    var score_text = "Total Score: $" + string(obj_controller.player_money);
	
	// Center these messages on the screen
    var center_x = room_width / 2;
    var center_y = room_height / 2;

    draw_text_transformed(center_x, center_y - 20, win_text, 2, 2, 0);  // Display "You Win!" message
    draw_text(center_x, center_y + 20, score_text);  // Display the total score	
}