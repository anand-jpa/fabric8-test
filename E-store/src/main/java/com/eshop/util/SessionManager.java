package com.eshop.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.eshop.model.Cart;
import com.eshop.model.User;

public class SessionManager {

	public static HttpSession getSession(HttpServletRequest request) {
		return request.getSession();
	}

	public static Cart getCart(HttpServletRequest request) {
		return (Cart) getSession(request).getAttribute("CART");
	}

	public static void setCart(HttpServletRequest request, Cart cart) {
		getSession(request).setAttribute("CART", cart);
	}

	public static void setUser(HttpServletRequest request, User user) {
		getSession(request).setAttribute("USER", user);
	}

	public static User getUserFromSession(HttpServletRequest request) {
		return (User) getSession(request).getAttribute("USER");
	}

	public static void logoutSession(HttpServletRequest request) {
		getSession(request).invalidate();
	}
}
