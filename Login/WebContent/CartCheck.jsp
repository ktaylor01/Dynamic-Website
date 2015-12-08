<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.login.DBConnection"%>
<%@page import="java.util.*"%>
<%@page import="com.login.ShoppingCart"%>
<%@page import="com.login.ShoppingCartDOA"%>
<%@page import="com.login.Product"%>
<%@page import="com.login.ProductDOA"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.login.CheckoutDAO"%>
<%@page import="com.login.Checkout"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		//session variable customerID
		int customerID = (Integer) session.getAttribute("id");

		//hidden values from home.jsp
		String itemName = request.getParameter("hidden");
		int itemId = Integer.parseInt(request.getParameter("hidden1"));
		String itemDes = request.getParameter("hidden2");

		//create and load new product object
		Product item = new Product();
		item.setProductName(itemName);
		item.setProductDescription(itemDes);
		item.setId(itemId);

		//Create a new arraylist
		List<ShoppingCart> cart = new ArrayList<ShoppingCart>();

		//calling addItemToCart returns an arrayList of product objects(items)
		cart = ShoppingCartDOA.addItemToCart(customerID, item);

		//save arrayList in session
		if (!(cart.isEmpty())) {
			session = request.getSession();
			session.setAttribute("cart", cart);
			response.sendRedirect("Cart.jsp");

		} else {
			response.sendRedirect("Error.jsp");
		}
	%>
</body>
</html>