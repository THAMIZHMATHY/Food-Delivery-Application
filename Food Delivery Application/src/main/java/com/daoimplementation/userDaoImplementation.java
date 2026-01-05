package com.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.dao.userDao;
import com.model.User;
import com.utility.DBConnection;

public class userDaoImplementation implements userDao {
	
	private static final String ADD_USER="INSERT into user (username,password,email,address,role,createdDate,lastLoginDate)"
			+ "VALUES(?,?,?,?,?,?,?)";
	
	private static final String GET_USER="SELECT * FROM user WHERE userId=?";
	private static final String UPDATE_USER="UPDATE user SET password=?, email=?, address=?, role=? WHERE userId=?";
	private static final String DELETE_USER =
		    "DELETE from user WHERE userId=?";
	private static final String GET_ALL_USER="SELECT *FROM user";
	private static final String LOGIN_USER =
	        "SELECT * FROM user WHERE username=? AND password=?";


	@Override
	public void addUser(User u) {
		Connection connection=DBConnection.getConnection();
		try {
			
			PreparedStatement prepareStatement=connection.prepareStatement(ADD_USER);
			prepareStatement.setString(1,u.getUsername() );
			prepareStatement.setString(2, u.getPassword());
			prepareStatement.setString(3, u.getEmail());
			prepareStatement.setString(4, u.getAddress());
			prepareStatement.setString(5, u.getRole());
			prepareStatement.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			prepareStatement.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
			
			prepareStatement.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Override
	public User getUser(int id) {
		Connection connection=DBConnection.getConnection();
		User u=null;
		
		
		try {
			PreparedStatement prepareStatement=connection.prepareStatement(GET_USER);
			prepareStatement.setInt(1, id);
			ResultSet res=prepareStatement.executeQuery();
			while(res.next()) {
				u = extractUser(res);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return u;
	}
	@Override
	public User getUserByUsernameAndPassword(String username, String password) {

	    Connection connection = DBConnection.getConnection();
	    User user = null;

	    try {
	        PreparedStatement ps = connection.prepareStatement(LOGIN_USER);
	        ps.setString(1, username);
	        ps.setString(2, password);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            user = extractUser(rs);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return user;
	}


	@Override
	public void updateUser(User u) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement prepareStatement=connection.prepareStatement(UPDATE_USER);
			prepareStatement.setString(1, u.getPassword());
			prepareStatement.setString(2, u.getEmail());
			prepareStatement.setString(3, u.getAddress());
			prepareStatement.setString(4, u.getRole());
			prepareStatement.setInt(5, u.getUserId());
			prepareStatement.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void deleteUser(int id) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement prepareStatement=connection.prepareStatement(DELETE_USER);
			prepareStatement.setInt(1, id);
			prepareStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Override
	public List<User> getAllUser() {
		Connection connection=DBConnection.getConnection();
		User u=null;
		ArrayList<User> usersList = new ArrayList<User>();
		try {
			Statement statement=connection.createStatement();
			ResultSet res=statement.executeQuery(GET_ALL_USER);
			while(res.next()) {
				u = extractUser(res);
				usersList.add(u);
				
			}	
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return usersList;
	}
	
	
	

	private User extractUser(ResultSet res) throws SQLException {
		User u;
		int userId=res.getInt("userId");
		String username=res.getString("username");
		String password=res.getString("password");
		String email=res.getString("email");
		String address=res.getString("address");
		String role=res.getString("role");
		
		
		u=new User(userId,username,password,email,address,role);
		return u;
	}

}
