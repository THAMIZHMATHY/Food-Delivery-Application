package com.dao;

import java.util.List;

import com.model.Restaurant;

public interface RestaurantDao {
	void addRestaurant(Restaurant r);
    Restaurant getRestaurant(int id);
    void updateRestaurant(Restaurant r);
    void deleteRestaurant(int id);
    List<Restaurant> getAllRestaurants();

}
