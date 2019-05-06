package com.eshop.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eshop.model.User;
import com.eshop.service.UserService;
import com.eshop.util.SessionManager;
//Controller 

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private UserService userService;

	@RequestMapping
	public String adminLogin(Map model) {
		User user = new User();
		model.put("user", user);
		return "/admin/login";
	}

	@RequestMapping(path = "home", method = RequestMethod.GET)
	public String adminHome(Model model) {
		return "/admin/home";
	}

	@RequestMapping(path = "manageCategory", method = RequestMethod.GET)
	public String manageCategory(Model model) {
		return "/admin/manageCategory";
	}

	@RequestMapping(path = "manageProduct", method = RequestMethod.GET)
	public String manageProduct(Model model) {
		return "/admin/manageProduct";
	}

	@RequestMapping(path = "logout")
	public String adminLogout(HttpServletRequest request) {
		SessionManager.logoutSession(request);
		return "redirect:/admin";
	}
}
