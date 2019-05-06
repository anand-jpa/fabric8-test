package com.eshop.model.dto;

import java.io.Serializable;

public class UserDTO implements Serializable {

	private static final long serialVersionUID = 7351824548180824311L;

	private String name;
	private String emailAddress;
	private String password;
	private String confirmPassword;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public UserDTO(String name, String emailAddress, String password, String confirmPassword) {
		super();
		this.name = name;
		this.emailAddress = emailAddress;
		this.password = password;
		this.confirmPassword = confirmPassword;
	}

	public UserDTO() {
		super();
	}

}
