<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.login.DBConnection"%>
<%@page import="com.login.Customer"%>
<%@page import="com.login.CustomerDOA"%>
<%@page import="com.login.Product"%>
<%@page import="com.login.ProductDOA"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	</br>
	</br>

	<center>
		<h2>
			<%
				String customerFName = session.getAttribute("fname").toString();
				String customerLName = session.getAttribute("lname").toString();
				int customerID = (Integer) session.getAttribute("id");
				out.println("Welcome " + customerFName + " " + customerLName + ", Customer ID: " + customerID);
			%>
		</h2>
		</br> </br> </br>
		<h1>Products</h1>
		
		<%
			List<Product> prodList = new ArrayList<Product>();
			prodList = ProductDOA.allProducts();
		%>
		
		<form action="CartCheck.jsp" method="post">
			<table id="productOutput" align="center" width="600" border="1">
				<tbody>
					<tr>

						<th width="98"><div align="center">Product ID</div></th>
						<th width="98"><div align="center">Product Name</div></th>
						<th width="98"><div align="center">Product Description</div></th>
						<th width="98"><div align="center">Add to Cart</div></th>

					</tr>
					<%
						for (Product p : prodList) {
					%>
					<tr>
						<form action="CartCheck.jsp">
							<td width="98"><div><%=p.getId()%></div></td>
							<td width="98"><div><%=p.getProductName()%></div></td>
							<td width="98"><div><%=p.getProductDescription()%></div></td>
							<td width="98"><input type="submit" name="submit"
								value="Add To Cart"></td> <input type="hidden" name="hidden"
								value="<%=p.getProductName()%>" /> <input type="hidden"
								name="hidden1" value="<%=p.getId()%>" /> <input type="hidden"
								name="hidden2" value="<%=p.getProductDescription()%>" />
						</form>

					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</form>
		</br> </br> </br> </br> <a href="logout.jsp">Logout</a>
	</center>

</body>
</html>