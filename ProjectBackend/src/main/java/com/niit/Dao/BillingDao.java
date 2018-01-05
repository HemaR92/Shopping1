package com.niit.Dao;

import java.util.List;

import com.niit.model.Billing;

public interface BillingDao {

		public boolean saveorupdate(Billing bill);

		public boolean delete(Billing bill);

		public Billing get(String billId);

		public List<Billing> list();
	}



