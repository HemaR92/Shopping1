package com.niit.Dao;

import java.util.List;

import com.niit.model.CartItems;

public interface CartItemsDao {

	public boolean saveorupdate(CartItems crtms);

	public boolean delete(String crtId);

	public CartItems get(String crtid);

	public List<CartItems> list();

	CartItems getlistall(String cartId, String pro);

	List<CartItems> getlist(String cartId);
}


