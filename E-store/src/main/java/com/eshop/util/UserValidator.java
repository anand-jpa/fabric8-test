package com.eshop.util;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.eshop.model.User;
import com.eshop.model.dto.UserDTO;

@Component
public class UserValidator implements Validator {

	public boolean supports(Class clasz) {
		return User.class.equals(clasz);
	}

	public void validate(Object obj, Errors errors) {
		User user = (User) obj;
		if (user.getName() == null || user.getName().length() == 0) {
			errors.rejectValue("name", "Username is Mandatory.", null, "Username is required.");
		}
		if (user.getPassword() == null || user.getPassword().length() == 0) {
			errors.rejectValue("name", "Password is Mandatory.", null, "Password is required.");
		}
	}

	public void validateRegister(Object obj, Errors errors) {
		UserDTO userDTO = (UserDTO) obj;
		if (userDTO.getName() == null || userDTO.getName().length() == 0) {
			errors.rejectValue("name", "Username is Mandatory.", null, "Username is required.");
		}
		if (userDTO.getPassword() == null || userDTO.getPassword().length() == 0) {
			errors.rejectValue("password", "Password is Mandatory.", null, "Password is required.");
		}
		if (userDTO.getConfirmPassword() == null || userDTO.getConfirmPassword().length() == 0) {
			errors.rejectValue("confirmPassword", "Confirm Password is Mandatory.", null, "Confirm Password is required.");
		}
		if(!userDTO.getPassword().equals(userDTO.getConfirmPassword())){
			errors.rejectValue("password", "Confirm Password is Mandatory.", null, "Confirm Password is required.");
		}
		if (userDTO.getEmailAddress() == null || userDTO.getEmailAddress().length() == 0) {
			errors.rejectValue("emailAddress", "EmailAddress is Mandatory.", null, "EmailAddress is required.");
		}
	}

}
