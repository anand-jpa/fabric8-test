package com.eshop.dao;

import com.eshop.model.Cart;

public interface CartDAO {

	Cart createCart(String sessionId, int userId);

	Cart getCartById(int cartId);

	Cart getCartBySessionId(String sessionId);

	public boolean saveCart(Cart cart);

	public void update(Cart cart);

}
