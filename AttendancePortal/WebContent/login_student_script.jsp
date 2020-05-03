<html>
<body>

<%@ page import="java.sql.*" %>
<% 
String url="jdbc:mysql://localhost:3306/attendance?useSSL=false";
try {
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loaded");
   Connection con= DriverManager.getConnection(url,"root","star");
    System.out.println("Connection Established");
    Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);  
    
    String s_uid=request.getParameter("s_uid");
    String s_name=request.getParameter("s_name");
  String s=  "SELECT s_name FROM students_h7 WHERE s_uid='"+s_uid+"'";
    ResultSet result=stmt.executeQuery(s); 
   result.absolute(1);
   out.println(result.getString(1));
   String password=result.getString(1);
   session.setAttribute("user1",s_name);
   session.setAttribute("user2",s_uid);
  if(password.equals(s_name))
  {
	  out.println("Access Granted");
	  response.sendRedirect("student_home.jsp");
  }
  else
  {
	  System.out.println("Access Denied");
	  session.setAttribute("error","Please enter correct E-mail id and Password" );
	  response.sendRedirect("login_student_error.jsp");
	 
  }
    con.close();
}
catch(ClassNotFoundException e)
{
    System.out.println("Driver Not Loaded");
} catch (SQLException e) {
    System.out.println("Connection not established");
}

%>

</body>
</html>