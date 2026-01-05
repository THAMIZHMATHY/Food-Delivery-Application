package com.dao;

import java.util.List;

import com.model.User;


public interface userDao {
	void addUser(User u);
	User getUser(int id);
	void updateUser(User u);
	void deleteUser(int id);
	List<User> getAllUser();
	User getUserByUsernameAndPassword(String username, String password);


}
