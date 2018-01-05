package com.niit.Dao;

import java.util.List;

import com.niit.model.Cart;

public interface CartDao {

	public boolean saveorupdate(Cart ctr);

	public boolean delete(Cart ctr);

	public Cart get(String ctrId);

	public List<Cart> list();
}


