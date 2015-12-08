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
<%@page import="com.login.Checkout"%>
<%@page import="com.login.CheckoutDAO"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Checkout</title>
</head>
<body>
	<h1>Checkout Page</h1>
	<h2>CUSTOMER BILLNG INFORMATION</h2>
	<%
		String customerFName = session.getAttribute("fname").toString();
		String customerLName = session.getAttribute("lname").toString();
		int customerID = (Integer) session.getAttribute("id");
		out.println(customerFName + " " + customerLName + ", Customer ID: " + customerID);

		List<Checkout> customerInfo = new ArrayList<Checkout>();
		List<Checkout> order = new ArrayList<Checkout>();

		customerInfo = CheckoutDAO.BillingInfo();
		order = CheckoutDAO.finalOrder();
		for (Checkout c : customerInfo) {
	%>

	<form action="Checkout.jsp" method="post">
		<table>
			<tbody>
				<tr>
					<td width="98"><div><%=c.getFirstName()%></div></td>
				</tr>
				<tr>
					<td width="98"><div><%=c.getLastName()%>
						</div></td>
				</tr>
				<tr>
					<td width="98"><div><%=c.getEmail()%></div></td>
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
	<h2>Final Order</h2>
	<form>
		<table align="center" width="600" border="1">
			<tbody>
				<%
					for (Checkout item : order) {
				%>
				<tr>
					<th width="98"><div align="center"><%=item.getProductName()%></div></th>
					<th width="98"><div align="center"><%=item.getProductDescription()%></div></th>
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
	<a href="OrderComplete.jsp"><div>
			<input type="submit" value="Place Order" /> </br> </br> </br>
</body>
</html>