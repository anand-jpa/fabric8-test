package com.eshop.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.xml.bind.annotation.XmlElement;

import com.eshop.model.CartItem;

@Entity
@Table(name = "cart")
public class Cart implements Serializable {

	private static final long serialVersionUID = -4045729241960416615L;

	@XmlElement
	@Id
	@GeneratedValue
	private int cartId;

	@OneToMany(mappedBy = "cart", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<CartItem> cartItems;
	private double grandTotal;

	private String sessionId;

	@XmlElement
	@Min(value = -1, message = "The cart must be tagged to atleast one userId.")
	private int userId = -1;

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public double getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Cart(double grandTotal, String sessionId, int userId) {
		super();
		this.grandTotal = grandTotal;
		this.sessionId = sessionId;
		this.userId = userId;
	}

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

}
