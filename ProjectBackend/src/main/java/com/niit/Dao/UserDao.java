package com.niit.Dao;

import java.util.List;

import com.niit.model.User;

public interface UserDao {

	public boolean saveorupdate(User user);

	public boolean delete(User user);

	public User get(String uid);

	public List<User> list();

	public User isvalid(String umail, String upwd);
	
	public User getUseremail(String umail);
	
}
