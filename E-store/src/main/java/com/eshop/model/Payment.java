package com.eshop.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlElement;

@Entity
@Table(name = "payment")
public class Payment implements Serializable {

	private static final long serialVersionUID = -3169949973451954578L;

	@XmlElement
	@Id
	@GeneratedValue
	private int paymentId;

	private String cardType;
	private String CreditCardNumber;

	private String cvv;
	private String expirationDate;

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getCreditCardNumber() {
		return CreditCardNumber;
	}

	public void setCreditCardNumber(String creditCardNumber) {
		CreditCardNumber = creditCardNumber;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public String getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}

	public Payment(String cardType, String creditCardNumber, String cvv, String expirationDate) {
		super();
		this.cardType = cardType;
		CreditCardNumber = creditCardNumber;
		this.cvv = cvv;
		this.expirationDate = expirationDate;
	}

	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}

}
