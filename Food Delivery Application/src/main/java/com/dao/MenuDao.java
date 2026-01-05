package com.dao;

import java.util.List;

import com.model.Menu;

public interface MenuDao {
	void addMenu(Menu m);
    Menu getMenu(int id);
    void updateMenu(Menu m);
    void deleteMenu(int id);
    List<Menu> getAllMenu();
    List<Menu> getMenuByRestaurantId(int restaurantId);


}
