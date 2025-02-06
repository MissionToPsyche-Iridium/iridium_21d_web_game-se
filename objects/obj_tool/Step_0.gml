if (attached_to_lula) {
    // Ensure tool follows Lula's position
    var lula = instance_exists(lula_id) ? instance_find(lula_id, 0) : noone;
    
    if (lula != noone) {
        x = lula.x;
        y = lula.y - 10; // Keep tool slightly above Lula
    } else {
        // If Lula is deleted for some reason, detach the tool
        attached_to_lula = false;
    }
}
