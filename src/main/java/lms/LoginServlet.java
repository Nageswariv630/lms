package lms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet{
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   String id=req.getParameter("id");
   String name=req.getParameter("name");
   try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms","root","root");
	PreparedStatement ps = con.prepareStatement("select*from book where id=? and name=?");
	ps.setString(1, id);
	ps.setString(2, name);
	ResultSet rs=ps.executeQuery();
	PrintWriter pw=resp.getWriter();
	if(rs.next()) {
		HttpSession session = req.getSession();
		session.setAttribute("id",rs.getString(1));
		session.setAttribute("name",rs.getString(2));
		session.setAttribute("author",rs.getString(3));
		 try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms","root","root");
				Statement s = con.createStatement();
				ResultSet rs1 = s.executeQuery("select * from book");
				pw.write("<html><body><h1 id='msg'>Login Sucessfull</h1></body></html>");
				req.setAttribute("rs", rs1);
				RequestDispatcher rd = req.getRequestDispatcher("allbook.jsp");
				rd.include(req, resp);
				
				rs.close();
				s.close();
				con.close();
				
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
	}
	else {
		pw.write("<html><body><h1 id='msg'>Invalid Credentials</h1></body></html>");
	RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
	rd.include(req, resp);
	}
} catch (ClassNotFoundException | SQLException e) {
	e.printStackTrace();
}
   }
}
