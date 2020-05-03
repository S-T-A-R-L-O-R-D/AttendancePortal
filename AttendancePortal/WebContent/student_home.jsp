<html>
<head>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="boostrap/js/jquery-3.1.1.min.js" ></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"  href="style.css">
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
<div id="test3" style="overflow:auto;">
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
<div class="panel panel-primary" style="opacity:0.9;margin-top:30px;">
<div class="panel-heading" style="opacity:1;" >
<div class="row">
		<center><font size="50px" face="sans-serif"><b><% 
String name=(String)session.getAttribute("user1");  
String uid=(String)session.getAttribute("user2");  
out.print("Welcome "+name);  
%></b></font></center>
</div>
<hr>
<div class="row">
		<div class="col-xs-1" style="margin-left:20px;" >
				<h3>subject name </h3>
		</div>
		<div class="col-xs-4" style="margin-left:50px;" >
				<h3>Lecture Attended</h3>
		</div>
		<div class="col-xs-4" >
				<h3>Lecture Delivered</h3>
		</div>
		<div class="col-xs-2">
				<h3>Total Percentage</h3>
		</div>
</div>
</div>
		<div class="panel-body" >
		<% Connection con= DriverManager.getConnection(url,"root","star");
		Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);  
		%>
	<div class="panel panel-danger" >
				<div class="panel-body" >
	<div class="row" >
		<div class="col-xs-2" >
				java
		</div>
		<div class="col-xs-4" >
				<%
				String query1="SELECT attended FROM h7_java WHERE s_uid='"+uid+"'";
				ResultSet java=stmt.executeQuery(query1);
				java.absolute(1);
				int java_count=java.getInt(1);
				out.print(java.getInt(1));
				%>
		</div>
		<div class="col-xs-4" >
				<%
				String query11="SELECT  delivered FROM h7_java WHERE s_uid='17BCS3915'";
				ResultSet java1=stmt.executeQuery(query11);
				java1.absolute(1);
				int java_total=java1.getInt(1);
				out.print(java1.getInt(1));
				%>
			</div>
		<div class="col-xs-2">
		  <%
		  int java_percent=(java_count*100)/java_total;
		  out.print(java_percent+"%");
		  %>
		</div>
	</div>
	</div>
	</div>
	<div class="panel panel-danger" >
	<div class="panel-body" >
		<div class="row" >
		<div class="col-xs-2" >
				operating system
		</div>
		<div class="col-xs-4" >
				<%
				String query12="SELECT attended FROM h7_os WHERE s_uid='"+uid+"'";
				ResultSet os=stmt.executeQuery(query12);
				os.absolute(1);
				int os_count=os.getInt(1);
				out.print(os.getInt(1));
				%>
		</div>
		<div class="col-xs-4" >
				<%
				String query6="SELECT  delivered FROM h7_os WHERE s_uid='17BCS3915'";
				ResultSet os1=stmt.executeQuery(query6);
				os1.absolute(1);
				int os_total=os1.getInt(1);
				out.print(os1.getInt(1));
				%>
			</div>
		<div class="col-xs-2">
		 <%
		 int os_percent=(os_count*100)/os_total;
		 out.print(os_percent);
		 %>
		</div>
	</div>
	</div>
	</div>
	<div class="panel panel-danger" >
	<div class="panel-body" >
	<div class="row" >
		<div class="col-xs-2" >
				OOAD &SDLC
		</div>
		<div class="col-xs-4" >
				<%
				String query2="SELECT attended  FROM h7_ooad WHERE s_uid='"+uid+"'";
				ResultSet ooad=stmt.executeQuery(query2);
				ooad.absolute(1);
				int ooad_count=ooad.getInt(1);
				out.print(ooad.getInt(1));
				%>
		</div>
		<div class="col-xs-4" >
				<%
				String query7="SELECT  delivered FROM h7_ooad WHERE s_uid='17BCS3915'";
				ResultSet ooad1=stmt.executeQuery(query7);
				ooad1.absolute(1);
				int ooad_total=ooad1.getInt(1);
				out.print(ooad1.getInt(1));
				%>
			</div>
		<div class="col-xs-2">
		   <%
		   out.print((ooad_count*100)/ooad_total);
		   %>
		</div>
	</div>
	</div>
	</div>
	<div class="panel panel-danger" >
	<div class="panel-body" >
	<div class="row" >
		<div class="col-xs-2" >
				Datastructures
		</div>
		<div class="col-xs-4" >
				<%
				String query3="SELECT attended  FROM h7_ds WHERE s_uid='"+uid+"'";
				ResultSet ds=stmt.executeQuery(query3);
				ds.absolute(1);
				int ds_count=ds.getInt(1);
				out.print(ds.getInt(1));
				%>
		</div>
		<div class="col-xs-4" >
				<%
				String query8="SELECT  delivered FROM h7_ds WHERE s_uid='17BCS3915'";
				ResultSet ds1=stmt.executeQuery(query8);
				ds1.absolute(1);
				int ds_total=ds1.getInt(1);
				out.print(ds1.getInt(1));
				%>
			</div>
		<div class="col-xs-2">
		  <%
		  out.print((ds_count*100)/ds_total);
		  %>
		</div>
	</div>
	</div>
	</div>
	<div class="panel panel-danger" >
	<div class="panel-body" >
	<div class="row" >
		<div class="col-xs-2" >
				Mathematics
		</div>
		<div class="col-xs-4" >
				<%
				String query4="SELECT attended FROM h7_maths WHERE s_uid='"+uid+"'";
				ResultSet maths=stmt.executeQuery(query4);
				maths.absolute(1);
				int maths_count=maths.getInt(1);
				out.print(maths.getInt(1));
				%>
		</div>
		<div class="col-xs-4" >
				<%
				String query9="SELECT  delivered FROM h7_maths WHERE s_uid='17BCS3915'";
				ResultSet maths1=stmt.executeQuery(query9);
				maths1.absolute(1);
				int maths_total=maths1.getInt(1);
				out.print(maths1.getInt(1));
				%>
			</div>
		<div class="col-xs-2">
		   <%
		   out.print((maths_count*100)/maths_total);
		   %>
		</div>
	</div>
	</div>
	</div>
	<div class="panel panel-danger" >
	<div class="panel-body" >
	<div class="row" >
		<div class="col-xs-2" >
				Analog and Digital Electronics
		</div>
		<div class="col-xs-4" >
				<%
				String query5="SELECT attended  FROM h7_ade WHERE s_uid='"+uid+"'";
				ResultSet ade=stmt.executeQuery(query5);
				ade.absolute(1);
				int ade_count=ade.getInt(1);
				out.print(ade.getInt(1));
				%>
		</div>
		<div class="col-xs-4" >
				<%
				String query10="SELECT  delivered FROM h7_ade WHERE s_uid='17BCS3915'";
				ResultSet ade1=stmt.executeQuery(query10);
				ade1.absolute(1);
				int ade_total=ade1.getInt(1);
				out.print(ade1.getInt(1));
				%>
			</div>
		<div class="col-xs-2">
		  <%
		  out.print((ade_count*100)/ade_total);
		  %>
		</div>
	</div>
	</div>
	</div>
	</div>
		</div>
</div>
</div>
<% con.close(); %>
</body>
</html>