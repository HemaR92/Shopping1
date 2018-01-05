package com.niit.Dao;

import java.util.List;

import com.niit.model.Supplier;

public interface SupplierDao {
	
		public boolean saveorupdate(Supplier sup);

		public boolean delete(Supplier sup);

		public Supplier get(String supId);

		public List<Supplier> list();
	}



