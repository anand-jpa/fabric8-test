package com.eshop.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlElement;

@Entity
@Table(name = "user")
public class User implements Serializable {

	private static final long serialVersionUID = 7351824548180824311L;

	@XmlElement
	@Id
	@GeneratedValue
	private int userId;

	private String name;
	private String password;
	private String emailAddress;
	@Basic
	@Column(name = "enabled", columnDefinition = "BIT", length = 1)
	private Boolean enabled;

	private String role;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public User(String name, String password, String emailAddress, Boolean enabled, String role) {
		super();
		this.name = name;
		this.password = password;
		this.emailAddress = emailAddress;
		this.enabled = enabled;
		this.role = role;
	}

	public User(String name, String password, Boolean enabled, String role) {
		super();
		this.name = name;
		this.password = password;
		this.enabled = enabled;
		this.role = role;
	}

	public User() {
		super();
	}

	public static User createFromDataSet(ResultSet rs) throws SQLException {
		User user = new User();
		user.setUserId(rs.getInt("userId"));
		user.setName(rs.getString("name"));
		user.setEnabled(rs.getBoolean("enabled"));
		user.setEmailAddress(rs.getString("emailAddress"));
		user.setRole(rs.getString("role").trim());
		user.setPassword(rs.getString("password"));
		return user;
	}

}
