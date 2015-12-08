<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.login.DBConnection"%>
<%@page import="com.login.Customer"%>
<%@page import="com.login.CustomerDOA"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="javascript.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		List<Customer> customer = new ArrayList<Customer>();
		customer = CustomerDOA.userLogin(username, password);
		
		for (Customer e : customer) {
			String uname = e.getUname();
			String pword = e.getPword();
			int id = e.getId();
			String fname = e.getFirstName();
			String lname = e.getLastName();

			if (username.equals(uname) && password.equals(pword)) {
				session.setAttribute("fname", fname);
				session.setAttribute("lname", lname);
				session.setAttribute("id", id);
				response.sendRedirect("Home.jsp");

			} else {
				response.sendRedirect("Error.jsp");
			}
		}
	%>



</body>
</html>