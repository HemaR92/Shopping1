package com.niit.Dao;

import java.util.List;

import com.niit.model.Shipping;

public interface ShippingDao {

	public boolean saveorupdate(Shipping ship);

	public boolean delete(Shipping ship);

	public Shipping get(String shipId);

	public List<Shipping> list();

	List<Shipping> getaddbyuser(String u_id);
}
