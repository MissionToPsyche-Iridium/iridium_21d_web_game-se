draw_self();

// If the customer is ready to order, draw the thought bubble above their head
if (ready_to_seat && ready_to_order) {
    draw_sprite(spr_thought_bubble, 0, x - 10, y - 175);
}