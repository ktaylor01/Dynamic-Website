package com.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDOA {

	static Connection connection = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;

	
	//select customer from db according to username and password entered at login.
	public static List<Customer> userLogin(String username, String password) {
		List<Customer> customers = new ArrayList<Customer>();
		Customer c;

		try {
			connection = DBConnection.createConnection();
			Statement ps = connection.createStatement();
			rs = ps.executeQuery("SELECT * FROM Customer Where uname='" + username + "' AND pword='" + password + "'");

			while (rs.next()) {
				if ((rs.getString(5).equals(username)) && (rs.getString(6).equals(password))) {
					c = new Customer();
					c.setUname(rs.getString(5));
					c.setPword(rs.getString(6));
					c.setId(rs.getInt(1));//getting customerid
					c.setFirstName(rs.getString(2));//getting Customer First Name
					c.setLastName(rs.getString(3));//getting Customers Last Name
					customers.add(c);
				} else {
					System.out.println("INCORRECT USERNAME AND PASSWORD");
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (Exception e) {
				/* ignored */ }
			try {
				ps.close();
			} catch (Exception e) {
				/* ignored */ }
			try {
				connection.close();
			} catch (Exception e) {
				/* ignored */ }
		}

		System.out.println("SELECT SUCCESSFUL!!");
		return customers;
	}

	
	//insert new customer
	public static int newCustomer(Customer customer) {

		int result = 0;
		connection = DBConnection.createConnection();

		try {

			ps = connection.prepareStatement("INSERT INTO Customer"
					+ "(first_name, last_name, email, uname, pword, regdate)" + "VALUES(?,?,?,?,?, CURDATE())");

			ps.setString(1, customer.getFirstName());
			ps.setString(2, customer.getLastName());
			ps.setString(3, customer.getEmail());
			ps.setString(4, customer.getUname());
			ps.setString(5, customer.getPword());
			result = ps.executeUpdate();

			connection.close();

		} catch (SQLException e) {
			System.out.println("Insert Failes..." + e);
		} finally {
			try {
				rs.close();
			} catch (Exception e) {
				/* ignored */ }
			try {
				ps.close();
			} catch (Exception e) {
				/* ignored */ }
			try {
				connection.close();
			} catch (Exception e) {
				/* ignored */ }
		}
		System.out.println("Insert Successful");
		return result;
	}

}
