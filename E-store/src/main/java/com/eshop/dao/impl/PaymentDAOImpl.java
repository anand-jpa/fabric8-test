package com.eshop.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.eshop.dao.PaymentDAO;
import com.eshop.model.Order;
import com.eshop.model.Payment;

@Repository
@Transactional
public class PaymentDAOImpl implements PaymentDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public Payment save(Payment payment) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(payment);
		session.flush();
		return payment;
	}

	public void update(Payment payment) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(payment);
		session.flush();
	}

	public Payment getPaymentById(int paymentId) {
		Session session = sessionFactory.getCurrentSession();
		Payment payment = (Payment) session.get(Payment.class, paymentId);
		session.flush();
		if (payment != null) {
			return payment;
		}
		return null;
	}

}
