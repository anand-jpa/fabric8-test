package com.eshop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eshop.model.Cart;
import com.eshop.model.CartItem;
import com.eshop.service.CartItemService;
import com.eshop.service.CartService;
import com.eshop.util.SessionManager;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;

	@Autowired
	private CartItemService cartItemService;

	@RequestMapping("/view")
	public String getCartRedirect(Model model, HttpServletRequest request) {
		SessionManager sessionManager = new SessionManager();
		String sessionId = sessionManager.getSession(request).getId();
		Cart cart = cartService.getCartBySessionId(sessionId);
		model.addAttribute("cart", cart);
		return "/store/cart";
	}

	@RequestMapping(value = "/remove/{cartId}/{productId}", method = RequestMethod.POST)
	public String removeItem(@PathVariable(value = "productId") int productId,
			@PathVariable(value = "cartId") int cartId, HttpServletRequest request, Model model) {
		SessionManager sessionManager = new SessionManager();
		CartItem cartItem = cartItemService.getCartItemByProductId(productId, cartId);
		cartItemService.removeCartItem(cartItem);
		Cart cart = cartService.getCartById(cartId);
		model.addAttribute("cart", cart);
		return "/store/cartContent";
	}

}