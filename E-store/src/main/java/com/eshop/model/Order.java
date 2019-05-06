package com.eshop.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;

@Entity
@Table(name = "storeOrder")
public class Order implements Serializable {

	private static final long serialVersionUID = -8424487282823067059L;

	@Id
	@GeneratedValue
	private int orderGenId;

	@Min(value = -1)
	private int userId = -1;

	@Min(value = -1)
	private int addressId = -1;

	@Min(value = -1)
	private int cartId = -1;

	@Min(value = -1)
	private int paymentId = -1;

	private String status;

	@Temporal(TemporalType.DATE)
	private Date date;

	public Order(int userId, int addressId, int cartId, int paymentId, String status, Date date) {
		super();
		this.userId = userId;
		this.addressId = addressId;
		this.cartId = cartId;
		this.paymentId = paymentId;
		this.status = status;
		this.date = date;
	}

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getOrderGenId() {
		return orderGenId;
	}

	public void setOrderGenId(int orderGenId) {
		this.orderGenId = orderGenId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
