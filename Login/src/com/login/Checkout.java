package com.login;

import java.util.Date;

public class Checkout {
	Product product;
	Customer customer;
	int id;
	String productName;
	String productDescription;
	String firstName;
	String lastName;
	String email;
	String uname;
	String pword;
	Date regDate;
	
	

	public Checkout(Product product) {
		this.product = product;

	}

	public Checkout() {

	}

	public Product getProduct() {
		return product;
	}
	public Customer getCustomer(){
		return customer;
	}
	//I need help here...I cant access the setters and getters from my customer and product classes???
	// duplicating code here
	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id = id;
	}
	public String getProductName(){
		return productName;
	}
	public void setProductName(String productName){
		this.productName = productName;
	}
	public String getProductDescription(){
		return productDescription;
	}
	public void setProductDescription(String productDescription){
		this.productDescription = productDescription;
	}
	
	//customer 
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPword() {
		return pword;
	}

	public void setPword(String pword) {
		this.pword = pword;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

}
