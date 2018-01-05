package com.niit.Dao;

import java.util.List;

import com.niit.model.Order;

public interface OrderDao {

	public boolean saveorupdate(Order ord);

	public boolean delete(Order ord);

	public Order get(String ordId);

	public List<Order> list();
}


