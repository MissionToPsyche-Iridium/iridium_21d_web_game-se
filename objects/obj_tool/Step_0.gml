if (attached_to_lula) {
    // Ensure tool follows Lula's position
    var lula = instance_exists(lula_id) ? instance_find(lula_id, 0) : noone;
    
    if (lula != noone) {
        x = lula.x + 20;
        y = lula.y;
    } else {
        // If Lula is deleted for some reason, detach the tool
        attached_to_lula = false;
    }
}

if (tool_delivery_ready) {
	attached_to_lula = false;
	
	x = customer_id.x + 50;
    y = customer_id.y + 10;	
}