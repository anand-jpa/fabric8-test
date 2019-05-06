package com.eshop.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eshop.model.Address;
import com.eshop.model.Cart;
import com.eshop.model.Order;
import com.eshop.model.Payment;
import com.eshop.model.User;
import com.eshop.service.AddressService;
import com.eshop.service.CartService;
import com.eshop.service.OrderService;
import com.eshop.service.PaymentService;
import com.eshop.service.UserService;
import com.eshop.util.RandomPasswordGenerator;
import com.eshop.util.SessionManager;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private CartService cartService;

	@Autowired
	private UserService userService;

	@Autowired
	private AddressService addressService;

	@Autowired
	private PaymentService paymentService;

	@Autowired
	private OrderService orderService;

	@RequestMapping("/checkout/{cartId}")
	public String getCartRedirect(@PathVariable(value = "cartId") int cartId, HttpServletRequest request, Model model) {
		SessionManager sessionManager = new SessionManager();
		Cart cart = cartService.getCartById(cartId);
		model.addAttribute("cart", cart);
		return "/store/order";
	}

	@RequestMapping(value = "/processOrder", method = RequestMethod.POST)
	public String processOrder(HttpServletRequest request, Model model) {
		SessionManager sessionManager = new SessionManager();
		String sessionId = sessionManager.getSession(request).getId();
		Cart cart = cartService.getCartBySessionId(sessionId);

		String name = request.getParameter("name");
		String password = RandomPasswordGenerator.randomString(8);
		String emailAddress = request.getParameter("email_address");
		User user = new User(name, password, emailAddress, true, "USER");
		userService.save(user);

		String streetName = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String zipCode = request.getParameter("zip_code");
		String phoneNumber = request.getParameter("phone_number");
		Address address = new Address(streetName, city, state, country, zipCode, phoneNumber, user.getUserId());
		addressService.save(address);

		String creditCardType = request.getParameter("creditCardType");
		String cardnumber = request.getParameter("cardnumber");
		String cvv = request.getParameter("cvv");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		Payment payment = new Payment(creditCardType, cardnumber, cvv, month + "/" + year);
		paymentService.save(payment);

		Order order = new Order(user.getUserId(), address.getAddressId(), cart.getCartId(), payment.getPaymentId(), "P",
				new Date());
		orderService.save(order);
		return "redirect:/order/invoice/" + order.getOrderGenId();
	}

	@RequestMapping("/invoice/{orderId}")
	public String getInvoiceRedirect(@PathVariable(value = "orderId") int orderId, HttpServletRequest request,
			Model model) {
		Order order = orderService.getOrderById(orderId);
		model.addAttribute("order", order);
		model.addAttribute("cart", cartService.getCartById(order.getCartId()));
		model.addAttribute("payment", paymentService.getPaymentById(order.getPaymentId()));
		model.addAttribute("address", addressService.findAddressById(order.getAddressId()));
		model.addAttribute("user", userService.findUserById(order.getUserId()));
		return "/store/invoice";
	}

}