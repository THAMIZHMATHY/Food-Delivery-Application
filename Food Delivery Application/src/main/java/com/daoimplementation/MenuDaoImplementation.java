package com.daoimplementation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.MenuDao;
import com.model.Menu;
import com.utility.DBConnection;

public class MenuDaoImplementation implements MenuDao {
	private static final String ADD_MENU =
            "INSERT INTO menu (restaurantId, itemName, description, price, isAvailable, imagePath) VALUES (?,?,?,?,?,?)";

    private static final String GET_MENU =
            "SELECT * FROM menu WHERE menuId=?";

    private static final String UPDATE_MENU =
            "UPDATE menu SET itemName=?, description=?, price=?, isAvailable=?, imagePath=? WHERE menuId=?";

    private static final String DELETE_MENU =
            "DELETE FROM menu WHERE menuId=?";

    private static final String GET_ALL_MENU =
    		"SELECT * FROM menu";
    
    private static final String GET_MENU_BY_RESTAURANT =
            "SELECT * FROM menu WHERE restaurantId = ? AND isAvailable = 1";

    
    @Override
    public void addMenu(Menu m) {
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(ADD_MENU);
            ps.setInt(1, m.getRestaurantId());
            ps.setString(2, m.getItemName());
            ps.setString(3, m.getDescription());
            ps.setDouble(4, m.getPrice());
            ps.setBoolean(5, m.isAvailable());
            ps.setString(6, m.getImagePath());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Menu getMenu(int id) {
        Connection connection = DBConnection.getConnection();
        Menu m = null;

        try {
            PreparedStatement ps = connection.prepareStatement(GET_MENU);
            ps.setInt(1, id);
            ResultSet res = ps.executeQuery();

            if (res.next()) {
                m = extractMenu(res);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return m;
    }
    
    @Override
    public List<Menu> getMenuByRestaurantId(int restaurantId) {

        Connection connection = DBConnection.getConnection();
        List<Menu> menuList = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(GET_MENU_BY_RESTAURANT);
            ps.setInt(1, restaurantId);

            ResultSet res = ps.executeQuery();

            while (res.next()) {
                Menu m = extractMenu(res);
                menuList.add(m);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menuList;
    }


    

    @Override
    public void updateMenu(Menu m) {
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_MENU);
            ps.setString(1, m.getItemName());
            ps.setString(2, m.getDescription());
            ps.setDouble(3, m.getPrice());
            ps.setBoolean(4, m.isAvailable());
            ps.setString(5, m.getImagePath());
            ps.setInt(6, m.getMenuId());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteMenu(int id) {
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_MENU);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public List<Menu> getAllMenu() {
    	Connection connection = DBConnection.getConnection();
    	List<Menu> list = new ArrayList<>();
    	
    	try {
    		Statement stmt = connection.createStatement();
    		ResultSet res = stmt.executeQuery(GET_ALL_MENU);
    		
    		while (res.next()) {
    			list.add(extractMenu(res));
    		}
    		
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	
    	return list;
    }

    private Menu extractMenu(ResultSet res) throws SQLException {
        return new Menu(
                res.getInt("menuId"),
                res.getInt("restaurantId"),
                res.getString("itemName"),
                res.getString("description"),
                res.getDouble("price"),
                res.getBoolean("isAvailable"),
                res.getString("imagePath")
        );
    }
	

}
