package com.niit.model;

import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity 
@Table
@Component
public class CartItems {

	@Id
	private String carId;
	@ManyToOne
	@JoinColumn(name="cartId")
	private Cart cart;
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="prodId")
	private Product product;
	public CartItems() {
		
		this.carId ="CITEMS"+UUID.randomUUID().toString().substring(30).toUpperCase();
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	private float price;
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
}
