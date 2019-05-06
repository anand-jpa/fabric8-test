package com.eshop.controller.ws;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.eshop.model.Cart;
import com.eshop.model.CartItem;
import com.eshop.model.Product;
import com.eshop.service.CartItemService;
import com.eshop.service.CartService;
import com.eshop.service.ProductService;
import com.eshop.util.SessionManager;

@RestController
@RequestMapping("/rest/cart")
public class CartRestController {

	@Autowired
	private CartService cartService;

	@Autowired
	private CartItemService cartItemService;

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/{cartId}", method = RequestMethod.GET)
	public @ResponseBody Cart getCartById(@PathVariable(value = "cartId") int cartId) {
		return cartService.getCartById(cartId);
	}

	@RequestMapping(value = "/add/{productId}", method = RequestMethod.POST)
	public ResponseEntity addItem(@PathVariable(value = "productId") int productId, HttpServletRequest request) {
		SessionManager sessionManager = new SessionManager();
		String sessionId = sessionManager.getSession(request).getId();
		Cart cart = cartService.getCartBySessionId(sessionId);
		if (cart == null) {
			cart = cartService.createCart(sessionId, -1);
		}
		Product product = productService.findProductById(productId);
		List<CartItem> cartItems = cart.getCartItems();
		boolean addtoCart = false;
		if (cartItems != null && cartItems.size() > 0) {
			for (int i = 0; i < cartItems.size(); i++) {
				if (product.getId() == cartItems.get(i).getProduct().getId()) {
					CartItem cartItem = cartItems.get(i);
					cartItem.setQuantity(cartItem.getQuantity() + 1);
					cartItem.setTotalPrice(product.getPrice() * cartItem.getQuantity());
					cartItemService.addCartItem(cartItem);
					addtoCart = true;
				}
			}
		}
		if (!addtoCart) {
			CartItem cartItem = new CartItem();
			cartItem.setProduct(product);
			cartItem.setQuantity(1);
			cartItem.setTotalPrice(product.getPrice() * cartItem.getQuantity());
			cartItem.setCart(cart);
			cartItemService.addCartItem(cartItem);
		}
		cartService.setGrandTotalForCart(cart.getCartId());
		return new ResponseEntity(HttpStatus.OK);
	}

	@RequestMapping(value = "/remove/{cartId}/{productId}", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void removeItem(@PathVariable(value = "productId") int productId,
			@PathVariable(value = "cartId") int cartId) {
		SessionManager sessionManager = new SessionManager();
		CartItem cartItem = cartItemService.getCartItemByProductId(productId, cartId);
		cartItemService.removeCartItem(cartItem);
		cartService.setGrandTotalForCart(cartId);
	}

	@RequestMapping(value = "/{cartId}", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void clearCart(@PathVariable(value = "cartId") int cartId) {
		Cart cart = cartService.getCartById(cartId);
		cartItemService.removeAllCartItems(cart);
	}

	@ExceptionHandler(IllegalArgumentException.class)
	@ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "Illegal request, please verify your payload")
	public void handleClientErrors(Exception ex) {

	}

	@ExceptionHandler(Exception.class)
	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason = "Internal Server Error")
	public void handleServerErrors(Exception ex) {

	}

} // The End of Class;
