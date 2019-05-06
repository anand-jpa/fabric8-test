package com.eshop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eshop.model.User;
import com.eshop.model.dto.UserDTO;
import com.eshop.service.UserService;
import com.eshop.util.SessionManager;
import com.eshop.util.UserValidator;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private UserService userService;

	@Autowired
	private UserValidator userValidator;

	@RequestMapping
	public String login(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		UserDTO userDTO = new UserDTO();
		model.addAttribute("registerUser", userDTO);
		return "/store/login";
	}

	@RequestMapping(value = "/admin/", method = RequestMethod.POST)
	public String adminLogin(@ModelAttribute("user") User user, BindingResult result, HttpServletRequest request) {
		userValidator.validate(user, result);

		if (result.hasErrors()) {
			return "/admin/login";
		}

		User user1 = userService.verifyUser(user.getName(), user.getPassword(), "ADMIN");
		if (user1 != null) {
			SessionManager.setUser(request, user1);
			return "/admin/home";
		}
		return "redirect:/admin";
	}

	@RequestMapping(value = "/store/", method = RequestMethod.POST)
	public String storeLogin(@ModelAttribute("user") User user, BindingResult result, HttpServletRequest request,
			Model model) {
		userValidator.validate(user, result);

		if (result.hasErrors()) {
			UserDTO userDTO = new UserDTO();
			model.addAttribute("registerUser", userDTO);
			return "/store/login";
		}

		User user1 = userService.verifyUser(user.getName(), user.getPassword(), "USER");
		if (user1 != null && user1.getRole().equals("USER")) {
			SessionManager.setUser(request, user1);
			return "redirect:/home";
		}
		return "redirect:/login";
	}
}
