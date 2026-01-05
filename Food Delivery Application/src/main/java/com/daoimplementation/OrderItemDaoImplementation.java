package com.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.OrderItemDao;
import com.model.OrderItem;
import com.utility.DBConnection;

public class OrderItemDaoImplementation implements OrderItemDao{
	private static final String ADD_ORDER_ITEM = 
	        "INSERT INTO order_item (orderId, menuId, totalAmount) VALUES (?, ?, ?)";
	    
	    private static final String GET_ORDER_ITEM = 
	        "SELECT * FROM order_item WHERE orderItemId=?";
	    
	    private static final String UPDATE_ORDER_ITEM = 
	        "UPDATE order_item SET orderId=?, menuId=?, totalAmount=? WHERE orderItemId=?";
	    
	    private static final String DELETE_ORDER_ITEM = 
	        "DELETE FROM order_item WHERE orderItemId=?";
	    
	    private static final String GET_ALL_ORDER_ITEMS = 
	        "SELECT * FROM order_item";

	    @Override
	    public void addOrderItem(OrderItem oi) {
	        Connection connection = DBConnection.getConnection();
	        try {
	            PreparedStatement ps = connection.prepareStatement(ADD_ORDER_ITEM);
	            ps.setInt(1, oi.getOrderId());
	            ps.setInt(2, oi.getMenuId());
	            ps.setDouble(3, oi.getTotalAmount());
	            
	            ps.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    @Override
	    public OrderItem getOrderItem(int id) {
	        Connection connection = DBConnection.getConnection();
	        OrderItem oi = null;
	        try {
	            PreparedStatement ps = connection.prepareStatement(GET_ORDER_ITEM);
	            ps.setInt(1, id);
	            ResultSet res = ps.executeQuery();
	            if (res.next()) {
	                oi = extractOrderItem(res);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return oi;
	    }

	    @Override
	    public void updateOrderItem(OrderItem oi) {
	        Connection connection = DBConnection.getConnection();
	        try {
	            PreparedStatement ps = connection.prepareStatement(UPDATE_ORDER_ITEM);
	            ps.setInt(1, oi.getOrderId());
	            ps.setInt(2, oi.getMenuId());
	            ps.setDouble(3, oi.getTotalAmount());
	            ps.setInt(4, oi.getOrderItemId());
	            
	            ps.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    @Override
	    public void deleteOrderItem(int id) {
	        Connection connection = DBConnection.getConnection();
	        try {
	            PreparedStatement ps = connection.prepareStatement(DELETE_ORDER_ITEM);
	            ps.setInt(1, id);
	            ps.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    @Override
	    public List<OrderItem> getAllOrderItems() {
	        Connection connection = DBConnection.getConnection();
	        List<OrderItem> orderItemsList = new ArrayList<>();
	        try {
	            Statement stmt = connection.createStatement();
	            ResultSet res = stmt.executeQuery(GET_ALL_ORDER_ITEMS);
	            while (res.next()) {
	                OrderItem oi = extractOrderItem(res);
	                orderItemsList.add(oi);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return orderItemsList;
	    }

	    private OrderItem extractOrderItem(ResultSet res) throws SQLException {
	        int orderItemId = res.getInt("orderItemId");
	        int orderId = res.getInt("orderId");
	        int menuId = res.getInt("menuId");
	        double totalAmount = res.getDouble("totalAmount");
	        
	        return new OrderItem(orderItemId, orderId, menuId, totalAmount);
	    }
	

}
