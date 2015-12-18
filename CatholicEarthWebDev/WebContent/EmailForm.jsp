<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<%@page import="com.CE.eNotificatioin.EmailContact"%>
<%@page import="com.CE.eNotificatioin.EmailContactDAO"%>
<%@page import="com.CE.eNotificatioin.SendEmail"%>
<%@page import="com.CE.eNotificatioin.SendEmailDAO"%>
<%@page import="com.CE.eNotificatioin.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="jsFile.js"></script>
<title>Insert title here</title>
</head>
<body onload="registered()">
	<h1>Enter your Email Address</h1>
	<%
		int results = 0;
		boolean exists = true;

		if (request.getParameter("submit") != null) {
			String firstName = new String();
			String lastName = new String();
			String emailAdd = new String();

			if (request.getParameter("fname") != null) {
				firstName = request.getParameter("fname");
			}
			if (request.getParameter("lname") != null) {
				lastName = request.getParameter("lname");
			}
			if (request.getParameter("email") != null) {
				emailAdd = request.getParameter("email");
			}

			String subject = "This is my test Subject line";
			String message = "Welcome to Catholic Earth's automated email notification feature";
			String sender = "kellytaylor644@gmail.com";

			SendEmail emailObj = new SendEmail();
			emailObj.setSubject(subject);
			emailObj.setMessage(message);
			emailObj.setSender(sender);

			EmailContact con = new EmailContact();
			con.setFirstName(firstName);
			con.setLastName(lastName);
			con.setEmail(emailAdd);

			exists = EmailContactDAO.doesExist(con);
			if (!(exists)) {
				results = EmailContactDAO.addEmailContact(con);
				SendEmailDAO.sendWelcomeMessage(con, emailObj);
			}

		}
	%>

	<form name="myform" action="EmailForm.jsp" method="post"
		onsubmit="return !!(validateemail() && validatefname() && validatelname() && displayResults())">
		<table id="contactInput" border="0">
			<tbody>
				<tr>
					<td>First Name:</td>
					<td><input type="text" name="fname" placeholder="First Name"
						size="50" /></td>
				</tr>
				<tr>
					<td>Last Name:</td>
					<td><input type="text" name="lname" placeholder="Last Name"
						size="50" /></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="text" name="email" placeholder="Email"
						size="50" /></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="Submit" name="submit" /> <input
			type="hidden" value=<%=results%> name="hidden" />
	</form>
	<a href="EmailMessage.jsp">FOR ADMIN ONLY! Group messaging</a>
</body>
</html>