package com.niit.Dao;

import java.util.List;

import com.niit.model.OrderItems;

public interface OrderItemsDao {

	public boolean saveorupdate(OrderItems ordtms);

	public boolean delete(OrderItems ordtms);

	public OrderItems get(String ordtmsId);

	public List<OrderItems> list();
}


