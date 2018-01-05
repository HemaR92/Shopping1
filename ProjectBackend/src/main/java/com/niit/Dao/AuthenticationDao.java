package com.niit.Dao;

import java.util.List;

import com.niit.model.Authentication;
import com.niit.model.Billing;

public interface AuthenticationDao {
	public boolean saveorupdate(Authentication autn);

	public boolean delete(Authentication autn);

	public Authentication get(String autnid);
	
	public List<Authentication> list();
}
