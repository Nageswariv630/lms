<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Books Details Page</title>
</head>
<body>

     <h1 style="text-align:center">Books Details</h1>
     <a id="createbut" href="reg.jsp"><button>Create</button></a>
     <h2><%=session.getAttribute("name") %></h2>
     <table border="3" cellpadding="10" rules="all" align="center" rules="all">
           <thead>
               <th>ID</th>
               <th>NAME</th>
               <th>AUTHOR</th>
               <th>PRICE</th>
               <th colspan="2">ACTION</th>
           </thead>
           
           <%
              ResultSet rs = (ResultSet) request.getAttribute("rs");
              while(rs.next()){
           %>
           <tr>
           <td> <%= rs.getString(1) %> </td>
           <td> <%= rs.getString(2) %> </td>
           <td> <%= rs.getString(3) %> </td>
           <td> <%= rs.getString(4) %> </td>
           <td> <a href="delete?id=<%= rs.getString(1)  %>" > <button>Delete</button> </a></td>
           <td> <a href="updatepage?id=<%=rs.getString(1) %>" > <button>Update</button> </a></td>
           </tr>
           <% 
           }
              %>
     </table>
<br>
<br>
<hr>
<br>
<br>
<center><a href="logout"><button>Logout</button></a></center>
      <script type="text/javascript">
       
   const msgele = document.getElementById("msg");
   setTimeout(()=>{
	   msgele.style.display = "none";
   },2000);
   
   </script>
</body>
</html>