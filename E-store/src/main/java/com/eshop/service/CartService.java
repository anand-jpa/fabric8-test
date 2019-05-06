package com.eshop.service;

import com.eshop.model.Cart;

public interface CartService {
	
	Cart createCart(String sessionId, int userId);

	Cart getCartById(int cartId);

	void update(Cart cart);

	Cart getCartBySessionId(String sessionId);

	public boolean saveCart(Cart cart);

	void setGrandTotalForCart(int cartId);
}
