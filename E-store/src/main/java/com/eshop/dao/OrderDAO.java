package com.eshop.dao;


import com.eshop.model.Order;

public interface OrderDAO {

	public boolean save(Order order);

	public void update(Order order);

	Order getOrderById(int orderId);
	
}
