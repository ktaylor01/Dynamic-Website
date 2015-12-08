package com.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDOA {

	static Connection connection = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static List<Product> items = new ArrayList<Product>();

	// write a select method to show all products
	// returns an array list of products.
	public static List<Product> allProducts() {
		connection = DBConnection.createConnection();
		List<Product> products = new ArrayList<Product>();
		Product p;
		try {
			ps = connection.prepareStatement("SELECT * FROM products");
			rs = ps.executeQuery();

			while (rs.next()) {
				p = new Product();
				p.setId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductDescription(rs.getString(3));
				products.add(p);
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
		return products;
	}
	

}
