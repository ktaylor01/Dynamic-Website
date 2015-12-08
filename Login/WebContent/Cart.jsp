<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%@page import="java.util.List"%>
<%@page import="com.login.DBConnection"%>
<%@page import="com.login.Customer"%>
<%@page import="com.login.CustomerDOA"%>
<%@page import="com.login.Product"%>
<%@page import="com.login.ProductDOA"%>
<%@page import="com.login.ShoppingCart"%>
<%@page import="com.login.ShoppingCartDOA"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cart</title>
</head>
<body>
	<h1>This is my cart</h1>
	<h2>
		<%
			String customerFName = session.getAttribute("fname").toString();
			String customerLName = session.getAttribute("lname").toString();
			int customerID = (Integer) session.getAttribute("id");
			out.println(customerFName + " " + customerLName + ", Customer ID: " + customerID);
		%>
	</h2>

	<form action="Cart.jsp" method="post">
		<table id="myCart" align="center" width="600" border="1">
			<tbody>
				<tr>
					<th width="98"><div align="center">ID</div></th>
					<th width="98"><div align="center">Product Name</div></th>
					<th width="98"><div align="center">Product Description</div></th>
					<th width="98"><div align="center">Quantity</div></th>


				</tr>
				<%
					Product p = new Product();

					ArrayList<ShoppingCart> prodList = (ArrayList<ShoppingCart>) session.getAttribute("cart");

					for (ShoppingCart cart : prodList) {
				%>
				<td width="98"><div><%=cart.getProduct().getId()%></div></td>
				<td width="98"><div><%=cart.getProduct().getProductName()%></div></td>
				<td width="98"><div><%=cart.getProduct().getProductDescription()%></div></td>
				<td width="98"><div><%=cart.getQuantity()%></div></td>
				<td width="98"><input type="reset" name="remove from Cart"
					value="Remove from Cart"></td>

				</tr>
				<%
					}
				%>

			</tbody>
		</table>
	</form>
	</br>
	</br>
	</br>
	<a href="Checkout.jsp"><div>
			<input type="submit" value="Proceed to Checkout" />
		</div></a>
	</br>
	</br>
	<a href="Home.jsp"><div>
			<input type="submit" value="Continue Shopping" />
		</div></a>
</body>
</html>