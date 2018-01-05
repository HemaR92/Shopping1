package com.niit.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity 
@Table(name="Orders")
@Component
public class Order {

	private static final DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    private static final DateFormat dtf = new SimpleDateFormat("HH:mm:ss");
	private static final long SerialVersionUID=1l;
	
	@OneToOne(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "bill_id")
	Billing billing;
	@OneToOne(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "Shippin_id")
	Shipping shipping;
	@OneToOne(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "pay_id")
	Pay pay;
	@OneToOne
	@JoinColumn(name = "u_Id")
	User user;
	@OneToMany(mappedBy="order",cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    List<OrderItems> OrderItems;
	
	@Id
	private String orderId;
	private double grandtotal;
    private String orderdate;
    private String ordertime;
    
    
    public Order(){
    	Date date = new Date();
		orderdate=sdf.format(date);
		Calendar cal = Calendar.getInstance();
		Date date1 = new Date();
		ordertime=dtf.format(date1);
		this.orderId = UUID.randomUUID().toString().substring(30).toUpperCase();
    }
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public double getGrandtotal() {
		return grandtotal;
	}
	public void setGrandtotal(double grandtotal) {
		this.grandtotal = grandtotal;
	}
	public Billing getBilling() {
		return billing;
	}
	public void setBilling(Billing billing) {
		this.billing = billing;
	}
	public Shipping getShipping() {
		return shipping;
	}
	public void setShipping(Shipping shipping) {
		this.shipping = shipping;
	}
	public Pay getPay() {
		return pay;
	}
	public void setPay(Pay pay) {
		this.pay = pay;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<OrderItems> getOrderItems() {
		return OrderItems;
	}
	public void setOrderItems(List<OrderItems> orderItems) {
		OrderItems = orderItems;
	}
	
	
	
}