package com.eshop.model;

/**
* ProductDAO model to define attributes of Product Class
*
* @author  Navinkumar
* @email   navinkumar.boddu@in.fujitsu.com
*/

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

@Entity
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
@Table(name = "product")
public class Product implements Serializable {

	private static final long serialVersionUID = 7326961244572654173L;

	@XmlElement
	@Id
	@GeneratedValue
	private int id;

	@XmlElement
	@NotEmpty(message = "The product name shouldn't be empty")
	private String name;

	@XmlElement
	@Min(value = 0, message = "The product price must not be less then zero")
	private double price;

	@XmlElement
	@Min(value = -1, message = "The product must be tagged to atleast one category.")
	private int categoryId;
	
	@XmlElement
	private String description;

	@XmlElement
	@Basic
	@Column(name = "status", columnDefinition = "BIT", length = 1)
	private boolean status;

	@XmlElement
	@Min(value = 0, message = "The product unit must not be less then zero")
	private int unitInStock;
	
	@XmlElement
	private String manufacturer;

	@Transient
	private MultipartFile productImage;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public int getUnitInStock() {
		return unitInStock;
	}

	public void setUnitInStock(int unitInStock) {
		this.unitInStock = unitInStock;
	}

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

}