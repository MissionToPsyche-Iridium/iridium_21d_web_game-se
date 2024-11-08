if (delivered && pizza_instance != noone) {
    // Clear the plate
    occupied = false;  // Mark plate as free
    instance_destroy(pizza_instance);  // Destroy the pizza instance on this plate
    pizza_instance = noone;  // Clear the reference
    delivered = false;  // Reset the delivered flag
    // Ensure plate is properly reset for future orders
    show_debug_message("Plate is now free and ready for a new pizza.");
}
