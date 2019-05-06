package com.eshop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eshop.dao.OrderDAO;
import com.eshop.model.Order;
import com.eshop.service.OrderService;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;

	public boolean save(Order order) {
		return orderDAO.save(order);
	}

	public void update(Order order) {
		orderDAO.update(order);

	}

	public Order getOrderById(int orderId) {
		return orderDAO.getOrderById(orderId);
	}

}
