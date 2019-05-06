package com.eshop.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * HomeController works for home page, login and static links
 *
 * @author  Navinkumar
 * @email   navinkumar.boddu@in.fujitsu.com
 */

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eshop.model.Product;
import com.eshop.model.User;
import com.eshop.model.dto.UserDTO;
import com.eshop.service.ProductService;
import com.eshop.service.UserService;
import com.eshop.util.SessionManager;
import com.eshop.util.UserValidator;

@Controller
public class HomeController {

	@Autowired
	private ProductService productService;

	@Autowired
	private UserService userService;

	@Autowired
	private UserValidator userValidator;

	@RequestMapping("/")
	public String start(Model model) {
		return "redirect:/home";
	}

	@RequestMapping("/home")
	public String home(Model model) {
		List<Product> products = productService.getProductList();
		Collections.shuffle(products);
		if (products.size() > 4) {
			model.addAttribute("products", products.subList(0, 3));
		} else {
			model.addAttribute("products", products);
		}
		return "/store/home";
	}

	@RequestMapping("/about")
	public String about() {
		return "about";
	}

	@RequestMapping(path = "logout")
	public String adminLogout(HttpServletRequest request) {
		SessionManager.logoutSession(request);
		return "redirect:/home";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String storeLogin(@ModelAttribute("registerUser") UserDTO userDTO, BindingResult result,
			HttpServletRequest request, Model model) {
		userValidator.validateRegister(userDTO, result);
		User user = new User(userDTO.getName(), userDTO.getPassword(), userDTO.getEmailAddress(), true, "USER");

		if (result.hasErrors()) {
			User user1 = new User();
			model.addAttribute("user", user1);
			request.setAttribute("register", "show");
			return "/store/login";
		}

		if (userService.findUserForEmailAddress(user.getEmailAddress()) == null) {
			User user1 = userService.save(user);
			SessionManager.setUser(request, user1);
			return "redirect:/home";
		} else {
			User user1 = new User();
			model.addAttribute("user", user1);
			request.setAttribute("register", "show");
			result.addError(new ObjectError("emailAddress", "EmailAddress is already in use."));
			return "/store/login";
		}
	}
} // The End of Class;
