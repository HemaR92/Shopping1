package com.niit.Dao;

import java.util.List;

import com.niit.model.Category;

public interface CategoryDao {

	public boolean saveorupdate(Category cat);

	public boolean delete(Category cat);

	public Category get(String cid);
	
	public List<Category> list();
}
