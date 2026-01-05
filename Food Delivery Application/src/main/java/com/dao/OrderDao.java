package com.dao;

import java.util.List;

import com.model.Order;

public interface OrderDao {
	int addOrder(Order o);    // Insert new order
    Order getOrder(int id);       // Get order by ID
    void updateOrder(Order o);    // Update order (like status, amount, address)
    void deleteOrder(int id); 
    List<Order> getAllOrders();   // Get all orders

}
