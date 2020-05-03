<html>
<body>
hi
<%@ page import="java.sql.*" %>
<% 
String url="jdbc:mysql://localhost:3306/attendance?useSSL=false";
try {
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loaded");
   Connection con= DriverManager.getConnection(url,"root","star");
    System.out.println("Connection Established");
    Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);  
    
    String t_uid=request.getParameter("t_uid");
    String t_name=request.getParameter("t_name");
    out.print(t_name+t_uid);
  String s=  "SELECT t_name FROM teachers WHERE t_uid='"+t_uid+"'";
    ResultSet result=stmt.executeQuery(s); 
   result.absolute(1);
 
   System.out.println(result.getString(1));
   String password=result.getString(1);
   session.setAttribute("user",t_name);
  if(password.equals(t_name))
  {
	  System.out.println("Access Granted");
	  response.sendRedirect("teacher_home.jsp");
  }
  else
  {
	  System.out.println("Access Denied");
	  session.setAttribute("error","Please enter correct E-mail id and Password" );
	  response.sendRedirect("login_teacher_error.jsp");
	 
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