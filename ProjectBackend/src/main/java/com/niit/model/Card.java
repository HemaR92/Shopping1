package com.niit.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity 
@Table
@Component
public class Card {

	@Id
	private String cardId;
	private String cardnumber;
	private String cardholdername;
	private String cardexpirydate;
	@ManyToOne
	@JoinColumn(name="uid")
	private User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getCardId() {
		return cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	public String getCardnumber() {
		return cardnumber;
	}
	public void setCardnumber(String cardnumber) {
		this.cardnumber = cardnumber;
	}
	public String getCardholdername() {
		return cardholdername;
	}
	public void setCardholdername(String cardholdername) {
		this.cardholdername = cardholdername;
	}
	public String getCardexpirydate() {
		return cardexpirydate;
	}
	public void setCardexpirydate(String cardexpirydate) {
		this.cardexpirydate = cardexpirydate;
	}

}
