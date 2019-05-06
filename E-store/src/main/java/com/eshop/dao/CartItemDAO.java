package com.eshop.dao;

import com.eshop.model.Cart;
import com.eshop.model.CartItem;

public interface CartItemDAO {

	void addCartItem(CartItem cartItem);

	void removeCartItem(CartItem cartItem);

	void removeAllCartItems(Cart cart);

	CartItem getCartItemByProductId(int productId);

	public CartItem getCartItemByProductId(int productId, int cartId);
}