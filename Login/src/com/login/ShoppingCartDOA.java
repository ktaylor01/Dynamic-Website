package com.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShoppingCartDOA {

	static Connection connection = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static List<ShoppingCart> items = new ArrayList<ShoppingCart>();

	/*
	 * METHOD TO DO addToCart() <DONE> updateItems() this will set the quantity
	 * and if its 0 it will remove the item getItems() returns arrayList of
	 * items getNumberOfItems() the number of items will be getQuantity() call
	 * 
	 * I shouldn't need ay sql in the shopping cart classes...but I will need
	 * sql for the place order classes.
	 */

	public static List<ShoppingCart> addItemToCart(int CustId, Product product) throws SQLException {
		
		connection = DBConnection.createConnection();
		boolean newItem = true;
		int results = 0;
		
		for (ShoppingCart p : items) {
			if (p.getProduct().getId() == product.getId()) {
				newItem = false;
				p.incrementQuantity();

			}
		}
		if (newItem) {
			ShoppingCart item = new ShoppingCart(product);
			items.add(item);
			ps = connection.prepareStatement("INSERT INTO ShoppingCart" + "(customer_id, product_id)" + "VALUES(?,?)");
			ps.setInt(1, CustId);
			ps.setInt(2, product.getId());
			results = ps.executeUpdate();

		}
		return items;
	}
	
	
	
	
	//write a method to get customers name to be set as a session variable
	
	

}
