package com.eshop.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.eshop.dao.OrderDAO;
import com.eshop.model.Cart;
import com.eshop.model.Order;

@Repository
@Transactional
public class OrderDAOImpl implements OrderDAO {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	public boolean save(Order order) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(order);
		session.flush();
		return true;
	}

	public void update(Order order) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(order);
		session.flush();
		
	}

	public Order getOrderById(int orderId) {
		Session session = sessionFactory.getCurrentSession();
		Order order = (Order) session.get(Order.class, orderId);
		session.flush();
		if (order != null) {
			return order;
		}
		return null;
	}

}
