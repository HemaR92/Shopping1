package com.niit.Dao;

import java.util.List;

import com.niit.model.Pay;

public interface PayDao {

	public boolean saveorupdate(Pay py);

	public boolean delete(Pay py);

	public Pay get(String pyId);

	public List<Pay> list();
}


