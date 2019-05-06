package com.eshop.dao;


import com.eshop.model.Payment;

public interface PaymentDAO {

	public Payment save(Payment payment);

	public void update(Payment payment);

	Payment getPaymentById(int paymentId);
	
}
