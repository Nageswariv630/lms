<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
<h2><%=session.getAttribute("name") %></h2>
	<h1>Login Form</h1>
	<form action="login" method="post">
		<input type="text" name="id" placeholder="Enter id">
		<input type="text" name="name" placeholder="Enter name">
		<button type="submit">Login</button>
	</form>
</body>
</html>