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
	try {
		String usernamee = request.getParameter("email");
		String passwordd = request.getParameter("pass");
		

		Class.forName("com.mysql.jdbc.Driver");

		Connection con = DriverManager.getConnection(

		"jdbc:mysql://localhost:3306/srm?characterEncoding=latin1", "root", "password");

		//here srm is database name,username is root and password is password

		PreparedStatement pst = con.prepareStatement("select email_id,new_password from required where email_id=? and new_password=?");
        pst.setString(1, usernamee);
        pst.setString(2, passwordd);
        ResultSet rs = pst.executeQuery(); 
        
        if(rs.next()){      
            out.println("SUCCESSFULLY LOGGED IN");
            out.println("<script>window.open('http://localhost:8080/NVV/main.jsp','_self')</script>");%>  
         <%}else{%>
         <script>
         document.write('INVALID CREDENTIALS'); 
         </script>
         <a href='login.html'>LOGIN</a>
         <%  
         }
        
        session.setAttribute("xyz", usernamee);
        
 		con.close();
 		

 	} catch (Exception e) {
 		System.out.println(e);
 	}
 %>
 
 
</body>
</html>

