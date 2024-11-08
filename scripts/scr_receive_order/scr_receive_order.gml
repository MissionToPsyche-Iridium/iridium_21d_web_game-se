function receive_order(customer_id, pizza_id) {
	var order = {
        customer_id: customer_id,
        pizza_id: pizza_id,
		order_status: "queued"
    };
    array_push(obj_chef.order_queue, order);
}