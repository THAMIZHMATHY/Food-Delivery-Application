package com.dao;

import java.util.List;

import com.model.OrderItem;

public interface OrderItemDao {
	void addOrderItem(OrderItem oi);   // Insert
    OrderItem getOrderItem(int id);    // Get Item by ID
    void updateOrderItem(OrderItem oi); // Update
    void deleteOrderItem(int id);       // Delete
    List<OrderItem> getAllOrderItems(); // List all order items

}
