package com.emusicstore.junit;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.eshop.dao.impl.UserDAOImpl;
import com.eshop.model.User;
import com.eshop.util.RandomPasswordGenerator;

public class UserServiceImplTest extends BaseTest {

	@Autowired
	private UserDAOImpl userService;

	int expectedUserId;
	static String expectedUserName;

	@BeforeClass
	public static void oneTimeSetUp() {
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyMMddhhmmssMs");
		String datetime = ft.format(dNow);
		expectedUserName = "vivek" + datetime;
	}

	@Test
	public void addUserTest() {
		User user = new User();
		user.setName(expectedUserName);
		user.setEmailAddress(expectedUserName + "@xyz.com");
		user.setEnabled(true);
		String password = RandomPasswordGenerator.randomString(8);
		user.setPassword(password);
		user.setRole("USER");
		userService.save(user);

		User expectedUser = userService.verifyUser(expectedUserName, password, "USER");
		assertTrue(user == expectedUser);
	}

	@Test
	public void findUserForEmailAddressTest() {
		User user = userService.findUserForEmailAddress(expectedUserName + "@xyz.com");
		assertNotNull(user);
	}

	@Test
	public void findUserByIdTest() {
		User user = userService.findUserById(1);
		assertNotNull(user);
	}

}
