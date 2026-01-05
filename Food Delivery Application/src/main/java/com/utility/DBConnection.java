package com.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
        "jdbc:mysql://localhost:3306/dao?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

    private static final String USERNAME = "root";
    private static final String PASSWORD = "Mathy@02";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

            if (connection != null) {
                System.out.println("✅ DB CONNECTED SUCCESSFULLY");
            } else {
                System.out.println("❌ CONNECTION IS NULL");
            }

        } catch (Exception e) {
            System.out.println("❌ DB CONNECTION FAILED");
            e.printStackTrace();
        }
        return connection;
    }
}
