package com.eshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eshop.dao.CartDAO;
import com.eshop.model.Cart;
import com.eshop.model.CartItem;
import com.eshop.service.CartService;

@Service
@Transactional
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cartDao;

	public Cart getCartById(int cartId) {
		return cartDao.getCartById(cartId);
	}

	public void update(Cart cart) {
		cartDao.update(cart);
	}

	public Cart getCartBySessionId(String sessionId) {
		return cartDao.getCartBySessionId(sessionId);
	}

	public boolean saveCart(Cart cart) {
		return cartDao.saveCart(cart);
	}

	public Cart createCart(String sessionId, int userId) {
		return cartDao.createCart(sessionId, userId);
	}

	public void setGrandTotalForCart(int cartId) {
		Cart cart = getCartById(cartId);
		List<CartItem> cartItems = cart.getCartItems();
		double grandTotal = 0;
		for (int i = 0; i < cartItems.size(); i++) {
			CartItem cartItem = cartItems.get(i);
			grandTotal += cartItem.getTotalPrice();
		}
		cart.setGrandTotal(grandTotal);
		cartDao.update(cart);
	}

} // The End of Class;
