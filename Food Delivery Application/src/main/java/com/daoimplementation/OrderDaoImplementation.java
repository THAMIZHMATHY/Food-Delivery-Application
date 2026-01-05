package com.daoimplementation;
import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.dao.OrderDao;
import com.model.Order;
import com.utility.DBConnection;



public class OrderDaoImplementation implements OrderDao{
	private static final String ADD_ORDER =
            "INSERT INTO `order` (userId, restaurantId, orderDate, totalAmount, status, paymentMode) VALUES (?,?,?,?,?,?)";

    private static final String GET_ORDER =
            "SELECT * FROM `order` WHERE orderId=?";

    private static final String UPDATE_ORDER =
            "UPDATE `order` SET totalAmount=?, status=?, paymentMode=? WHERE orderId=?";

    private static final String DELETE_ORDER =
            "DELETE FROM `order` WHERE orderId=?";

    private static final String GET_ALL_ORDERS =
            "SELECT * FROM `order`";

    @Override
    public int addOrder(Order o) {
    	    int orderId=0;
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(ADD_ORDER,Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, o.getUserId());
            ps.setInt(2, o.getRestaurantId());
            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            ps.setDouble(4, o.getTotalAmount());
            ps.setString(5, o.getStatus());
            ps.setString(6, o.getPaymentMode());

            int affectedRows=ps.executeUpdate();
            if(affectedRows==0) {
            	    throw new SQLException("Creating order failed, no rows affected.");
            }
            try(ResultSet generateKeys=ps.getGeneratedKeys()){
            	     if(generateKeys.next()) {
            	    	     orderId=generateKeys.getInt(1);
            	     }else {
            	    	     throw new SQLException("Creating order failed, no ID obtained.");
            	     }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderId;
    }

    @Override
    public Order getOrder(int id) {
        Connection connection = DBConnection.getConnection();
        Order o = null;

        try {
            PreparedStatement ps = connection.prepareStatement(GET_ORDER);
            ps.setInt(1, id);
            ResultSet res = ps.executeQuery();

            if (res.next()) {
                o = extractOrder(res);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return o;
    }

    @Override
    public void updateOrder(Order o) {
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_ORDER);
            ps.setDouble(1, o.getTotalAmount());
            ps.setString(2, o.getStatus());
            ps.setString(3, o.getPaymentMode());
            ps.setInt(4, o.getOrderId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrder(int id) {
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_ORDER);
            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Order> getAllOrders() {
        Connection connection = DBConnection.getConnection();
        List<Order> list = new ArrayList<>();

        try {
            Statement stmt = connection.createStatement();
            ResultSet res = stmt.executeQuery(GET_ALL_ORDERS);

            while (res.next()) {
                Order o = extractOrder(res);
                list.add(o);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    private Order extractOrder(ResultSet res) throws SQLException {
        Order o = new Order();
        o.setOrderId(res.getInt("orderId"));
        o.setUserId(res.getInt("userId"));
        o.setRestaurantId(res.getInt("restaurantId"));
        o.setOrderDate(res.getTimestamp("orderDate"));
        o.setTotalAmount(res.getDouble("totalAmount"));
        o.setStatus(res.getString("status"));
        o.setPaymentMode(res.getString("paymentMode"));

        return o;
    }

}
