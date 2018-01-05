package com.niit.model;

import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity 
@Table
@Component
public class User {

	@Id
	private String uid;
	private String uname;
    private String upwd;
    private String uaddress;
    private String umail;
    private String mobile;
    private String role="ROLE_USER";
    @OneToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="Billing_Id")
    private Billing billing;
    
    @OneToOne
    @JoinColumn(name="cartId")
    private Cart cart;
public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
public User() {
		
		this.uid ="USD"+UUID.randomUUID().toString().substring(30).toUpperCase();
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	public String getUmail() {
		return umail;
	}
	public void setUmail(String umail) {
		this.umail = umail;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Billing getBilling() {
		return billing;
	}
	public void setBilling(Billing billing) {
		this.billing = billing;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
    
    
    
}
