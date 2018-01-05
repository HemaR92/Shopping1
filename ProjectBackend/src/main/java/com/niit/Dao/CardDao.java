package com.niit.Dao;

import java.util.List;

import com.niit.model.Card;

public interface CardDao {

	public boolean saveorupdate(Card car);

	public boolean delete(Card car);

	public Card get(String carId);

	public List<Card> list();

	List<Card> getcardbyuser(String uid);
}

