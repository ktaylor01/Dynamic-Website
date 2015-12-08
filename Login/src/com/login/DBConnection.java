package com.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	static {
		try {
			// manually load com.mysql.jdbc.Driver into memory
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException cnf) {
			System.out.println("Driver could not be loaded: " + cnf);
		}
	}

	public static Connection createConnection() {

		String URL = "jdbc:mysql://localhost:3306/Retail";
		String USERNAME = "root";
		String PASSWORD = "root1";
		Connection connection = null;

		try {

			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			System.out.println("SUCCESS Database connecton:!");

		} catch (SQLException e) {
			System.out.println("Couldn't connect: exit.");
			System.exit(1);

		}
		return connection;
	}

}
