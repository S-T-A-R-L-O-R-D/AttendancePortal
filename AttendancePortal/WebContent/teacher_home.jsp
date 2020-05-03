<html>
<head>
<link rel="stylesheet" type="text/css"  href="style.css">

<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="boostrap/js/jquery-3.1.1.min.js" ></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>  

<%@ page import="java.sql.*" %>
<% 
String url="jdbc:mysql://localhost:3306/attendance?useSSL=false";
try {
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loaded");
   Connection con= DriverManager.getConnection(url,"root","star");
    System.out.println("Connection Established");
}
catch(ClassNotFoundException e)
{
    System.out.println("Driver Not Loaded");
} catch (SQLException e) {
    System.out.println("Connection not established");
}

%>
<div id="test1" style="overflow:auto;">
<nav class="navbar navbar-default navbar-fixed" style="margin-bottom:0px;">
<div style="margin-left:10px;margin-right:20px;">
	<div class="navbar-header">
	</div>
	<div>
	<a href="Home.html" class="navbar-brand"><img alt="Attendance-portal" src="img/menu.png" class="responsive" height="50px" width="90px;"></a>
	<ul class="nav navbar-nav navbar-right" style="font-size:20px;">
	<li class="form-group"><a href="login.html" ><span class="glyphicon glyphicon-bell "></span></a></li>
	<li><a href="login.html" ><span class="glyphicon glyphicon-book "></span></a></li>
	<li><a href="signup.html" ><span class="glyphicon glyphicon-home "></span></a></li>
	<li><a href="contact-us.html" ><span class="glyphicon glyphicon-cog "></span></a></li>
	</ul>
	</div>
	</div>
</nav>
<div class="container">
<form action="teacher_home_script.jsp" method="post">
<div class="panel panel-primary" style="opacity:0.9;margin-top:30px;">
<div class="panel-heading" style="opacity:1;" >
<div class="row">
		<center><font size="50px" face="verdana"><b><% 
String name=(String)session.getAttribute("user");  
out.print("Welcome "+name);  
%></b></font></center>
</div>
<hr>
<div class="row">
		<div class="col-xs-1" style="margin-left:20px;" >
				<h3>s.no.</h3>
		</div>
		<div class="col-xs-4" style="margin-left:50px;" >
				<h3>Student UID</h3>
		</div>
		<div class="col-xs-4" >
				<h3>Student name</h>
		</div>
		<div class="col-xs-2">
				<h3>Status</h3>
		</div>
</div>
</div>

				<div class="panel-body" >
<% Connection con= DriverManager.getConnection(url,"root","star");
Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);  
String s=  "SELECT * FROM students_h7";
int i=0;
  ResultSet result=stmt.executeQuery(s); 
while(result.next()){
	i++;
	%>
	<div class="panel panel-danger" >
				<div class="panel-body" >
	<div class="row" >
		<div class="col-xs-2" >
				<%
			   out.println(result.getString(1));
				%>
		</div>
		<div class="col-xs-4" >
				<%	
			   out.println(result.getString(2));
				%>
		</div>
		<div class="col-xs-4" >
				<%	
			   out.println(result.getString(3));
				%>
		</div>
		<div class="col-xs-2">
		
				<input type="radio" name="<%=i%>" value="present" checked>present
				<br>
				<input type="radio" name="<%=i%>" value="absent" >absent
		</div>
	</div>
	</div>
	</div>
	<%} %>
	</div>
	<div class="panel-footer" >
	<center><input type="submit" class="btn btn-danger" value="SUBMIT" max-width="100%"></center> 
	</div>
	</div>
	</form>
</div>
</div>
</body>
</html>