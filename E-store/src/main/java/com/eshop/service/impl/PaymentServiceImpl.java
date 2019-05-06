package com.eshop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eshop.dao.PaymentDAO;
import com.eshop.model.Payment;
import com.eshop.service.PaymentService;

@Service
@Transactional
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentDAO paymentDAO;

	public Payment save(Payment Payment) {
		return paymentDAO.save(Payment);
	}

	public void update(Payment Payment) {
		paymentDAO.update(Payment);

	}

	public Payment getPaymentById(int paymentId) {
		return paymentDAO.getPaymentById(paymentId);
	}

}
