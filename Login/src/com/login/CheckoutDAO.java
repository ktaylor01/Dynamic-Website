package com.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CheckoutDAO {

	static Connection connection = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;

	public static List<Checkout> finalOrder() throws SQLException {
		List<Checkout> order = new ArrayList<Checkout>();
		connection = DBConnection.createConnection();
		Checkout finalOrder;

		ps = connection.prepareStatement(
				"SELECT * FROM Products JOIN ShoppingCart ON ShoppingCart.product_id = Products.product_id");
		rs = ps.executeQuery();

		while (rs.next()) {
			finalOrder = new Checkout();
			finalOrder.setId(rs.getInt(1));
			finalOrder.setProductName(rs.getString(2));
			finalOrder.setProductDescription(rs.getString(3));
			order.add(finalOrder);
		}
		return order;
	}
	

	public static List<Checkout> BillingInfo() throws SQLException {
		List<Checkout> customer = new ArrayList<Checkout>();
		connection = DBConnection.createConnection();
		Checkout billing;

		ps = connection.prepareStatement(
				"SELECT Distinct first_name, last_name, email FROM Customer JOIN ShoppingCart ON ShoppingCart.customer_id = Customer.customer_id");
		rs = ps.executeQuery();

		while (rs.next()) {
			billing = new Checkout();
			// billing.setId(rs.getInt(1));
			billing.setFirstName(rs.getString(1));
			billing.setLastName(rs.getString(2));
			billing.setEmail(rs.getString(3));
			customer.add(billing);
		}
		return customer;
	}

}
