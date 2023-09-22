<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
try{
	String a= request.getParameter("fname");
	String b= request.getParameter("lname");
	String c= request.getParameter("gender");
	String d= request.getParameter("age");
	String e= request.getParameter("phone");
	String f= request.getParameter("college");
	String g= request.getParameter("username");
	String h= request.getParameter("new_password");
	String i= request.getParameter("confirm_password");
			
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection( 
"jdbc:mysql://localhost:3306/srm?characterEncoding=latin1","root","password");
Statement stmt=con.createStatement();
String res=String.format("insert into required values('%s','%s','%s','%s','%s','%s','%s','%s','%s')",a,b,c,d,e,f,g,h,i);
stmt.executeUpdate(res); 
out.println("<b><i>Registered successfully</i></b><br><br>");
con.close(); 
}catch(Exception e){System.out.println(e);}

%>
<a href="login.html">login</a>

</body>
</html>