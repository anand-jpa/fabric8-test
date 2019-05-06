package com.eshop.service;

import com.eshop.model.Payment;

public interface PaymentService {
	public Payment save(Payment Payment);

	public void update(Payment Payment);

	Payment getPaymentById(int paymentId);
}
