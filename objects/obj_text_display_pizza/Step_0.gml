// Step Event of obj_text_display_pizza

if (ChatterboxIsStopped(chatterbox)) {
    // Ensure textWidth and lineHeight are initialized before using them
    draw_text_ext_color(x, y, "No more dialogue", lineHeight, textWidth, c_aqua, c_aqua, c_aqua, c_aqua, 1);
} else {
    // Draw the dialogue text
    draw_text_ext_color(x, y, text, lineHeight, textWidth, c_aqua, c_aqua, c_aqua, c_aqua, 1);
}
