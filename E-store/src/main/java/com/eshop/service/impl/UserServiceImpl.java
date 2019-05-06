package com.eshop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eshop.dao.UserDAO;
import com.eshop.model.User;
import com.eshop.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	public User findUserById(int id) {
		return userDAO.findUserById(id);
	}

	public User save(User user) {
		return userDAO.save(user);
	}

	public void edit(User user) {
		userDAO.edit(user);
	}

	public void delete(User user) {
		userDAO.delete(user);
	}

	public User verifyUser(String name, String password, String role) {
		return userDAO.verifyJDBCUser(name, password, role);
	}

	public User findUserForEmailAddress(String emailAddress) {
		return userDAO.findUserForEmailAddress(emailAddress);
	}
}
