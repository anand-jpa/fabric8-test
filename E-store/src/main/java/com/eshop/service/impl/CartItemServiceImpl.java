package com.eshop.service.impl;

import com.eshop.dao.CartItemDAO;
import com.eshop.model.Cart;
import com.eshop.model.CartItem;
import com.eshop.service.CartItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CartItemServiceImpl implements CartItemService {

	@Autowired
	private CartItemDAO cartItemDao;

	public void addCartItem(CartItem cartItem) {
		cartItemDao.addCartItem(cartItem);
	}

	public void removeCartItem(CartItem cartItem) {
		cartItemDao.removeCartItem(cartItem);
	}

	public void removeAllCartItems(Cart cart) {
		cartItemDao.removeAllCartItems(cart);
	}

	public CartItem getCartItemByProductId(int productId) {
		return cartItemDao.getCartItemByProductId(productId);
	}

	public CartItem getCartItemByProductId(int productId, int cartId) {
		return cartItemDao.getCartItemByProductId(productId, cartId);
	}

} // The End of Class;
