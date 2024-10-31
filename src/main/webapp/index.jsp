<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
</head>
<body>
   <h1>Welcome to LMS</h1>
   <a href="reg.jsp"><button>Click here to Register</button></a>
   <a href="allbook"><button type= "submit">View All Books</button></a>
   
   <script type="text/javascript">
       
   let msgele = document.getElementById("msg");
   setTimeout(()=>{
	   msgele.style.display = "none";
   },2000);
   
   </script>
</body>
</html>