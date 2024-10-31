<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Page</title>
<style>
     form{
         display:flex;
         flex-direction:column;
         margin:auto;
         width:20%;
     }
</style>
</head>
<body>
     <%
          ResultSet rs = (ResultSet) request.getAttribute("rs");
             
       %>
<h2><%=session.getAttribute("name") %></h2>
     <h1>Update Page</h1>
     <form action="update" method="post">
          <input type="text" value="<%=rs.getInt(1) %>" name="id" placeholder="Enter id">
          <input type="text" value="<%=rs.getString(2) %>" name="name" placeholder="Enter Name">
          <input type="text" value="<%= rs.getString(3) %>" name="author" placeholder="Enter Author">
          <input type="text" value="<%= rs.getDouble(4) %>" name="price" placeholder="Enter Price">
          <button type="submit">Update</button>
     
     </form>
</body>
</html>