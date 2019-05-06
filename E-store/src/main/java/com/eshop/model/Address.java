package com.eshop.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.xml.bind.annotation.XmlElement;

@Entity
@Table(name = "address")
public class Address implements Serializable {

	private static final long serialVersionUID = -6398984890237493736L;

	@XmlElement
	@Id
	@GeneratedValue
	private int addressId;

	private String streetName;
	private String city;
	private String state;
	private String country;
	private String zipCode;
	private String phoneNumber;

	@XmlElement
	@Min(value = -1, message = "The cart must be tagged to atleast one userId.")
	private int userId = -1;

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Address(String streetName, String city, String state, String country, String zipCode, String phoneNumber,
			int userId) {
		this.streetName = streetName;
		this.city = city;
		this.state = state;
		this.country = country;
		this.zipCode = zipCode;
		this.phoneNumber = phoneNumber;
		this.userId = userId;
	}

	public Address() {
		super();
	}

}
