package com.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.RestaurantDao;
import com.model.Restaurant;
import com.utility.DBConnection;

public class RestaurantDaoImplementation implements RestaurantDao {
	private static final String ADD_RESTAURANT =
            "INSERT INTO restaurant (name, cuisineType, deliveryTime, address, adminUserId, rating, isActive, imagePath) VALUES (?,?,?,?,?,?,?,?)";

    private static final String GET_RESTAURANT =
            "SELECT * FROM restaurant WHERE restaurantId=?";

    private static final String UPDATE_RESTAURANT =
            "UPDATE restaurant SET name=?, cuisineType=?, deliveryTime=?, address=?, adminUserId=?, rating=?, isActive=?, imagePath=? WHERE restaurantId=?";

    private static final String DELETE_RESTAURANT =
            "DELETE FROM restaurant WHERE restaurantId=?";

    private static final String GET_ALL_RESTAURANTS =
    		"SELECT * FROM restaurant";
    
    @Override
    public void addRestaurant(Restaurant r) {
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(ADD_RESTAURANT);
            ps.setString(1, r.getName());
            ps.setString(2, r.getCuisineType());
            ps.setString(3, r.getDeliveryTime());
            ps.setString(4, r.getAddress());
            ps.setInt(5, r.getAdminUserId());
            ps.setDouble(6, r.getRating());
            ps.setBoolean(7, r.isActive());
            ps.setString(8, r.getImagePath());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Restaurant getRestaurant(int id) {
        Connection connection = DBConnection.getConnection();
        Restaurant r = null;

        try {
            PreparedStatement ps = connection.prepareStatement(GET_RESTAURANT);
            ps.setInt(1, id);
            ResultSet res = ps.executeQuery();

            if (res.next()) {
                r = extractRestaurant(res);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return r;
    }


    @Override
    public void updateRestaurant(Restaurant r) {
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_RESTAURANT);
            ps.setString(1, r.getName());
            ps.setString(2, r.getCuisineType());
            ps.setString(3, r.getDeliveryTime());
            ps.setString(4, r.getAddress());
            ps.setInt(5, r.getAdminUserId());
            ps.setDouble(6, r.getRating());
            ps.setBoolean(7, r.isActive());
            ps.setString(8, r.getImagePath());
            ps.setInt(9, r.getRestaurantId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteRestaurant(int id) {
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_RESTAURANT);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public List<Restaurant> getAllRestaurants() {
    	Connection connection = DBConnection.getConnection();
    	List<Restaurant> list = new ArrayList<>();
    	
    	try {
    		Statement stmt = connection.createStatement();
    		ResultSet res = stmt.executeQuery(GET_ALL_RESTAURANTS);
    		
    		while (res.next()) {
    			list.add(extractRestaurant(res));
    		}
    		
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	
    	return list;
    }

    private Restaurant extractRestaurant(ResultSet res) throws SQLException {
        Restaurant r = new Restaurant(
                res.getInt("restaurantId"),
                res.getString("name"),
                res.getString("cuisineType"),
                res.getString("deliveryTime"),
                res.getString("address"),
                res.getInt("adminUserId"),
                res.getDouble("rating"),
                res.getBoolean("isActive"),
                res.getString("imagePath")
        );
        return r;
    }

    
}
