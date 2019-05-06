package com.eshop.service;

import com.eshop.model.Order;

public interface OrderService {
	public boolean save(Order order);

	public void update(Order order);

	Order getOrderById(int orderId);
}
