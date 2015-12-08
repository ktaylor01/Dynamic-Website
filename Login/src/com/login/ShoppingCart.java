package com.login;

import com.login.Product;

public class ShoppingCart {

	Product product;
	Customer customer;
	int quantity;

	public ShoppingCart(Product product) {
		this.product = product;
		quantity = 1;
	}

	public ShoppingCart() {
		// TODO Auto-generated constructor stub
	}

	public Product getProduct() {
		return product;
	}
	public Customer getCustomer(){
		return customer;
	}

	// get Quantity
	public int getQuantity() {
		return quantity;
	}

	// set quantity
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	// increment quantity
	public void incrementQuantity() {
		quantity++;

	}

	// decrement quantity
	public void decrementQuantity() {
		quantity--;
	}

	/*
	 * add in handling prices and totals later
	 */

}
