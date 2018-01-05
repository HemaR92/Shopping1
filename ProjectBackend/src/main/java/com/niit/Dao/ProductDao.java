package com.niit.Dao;

import java.util.List;

import com.niit.model.Product;

public interface ProductDao {

	public boolean saveorupdate(Product prod);

	public boolean delete(Product prod);

	public Product get(String prodId);
	
	public List<Product> getProductByCategory(String Id);
	
	public List<Product> getProductBySupplier(String Id);

	public List<Product> list();
}
