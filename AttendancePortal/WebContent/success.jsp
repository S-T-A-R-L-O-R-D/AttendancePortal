<html>
<head>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="boostrap/js/jquery-3.1.1.min.js" ></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"  href="style.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="test2">
<nav class="navbar navbar-default navbar-fixed" style="margin-bottom:0px;">
<div style="margin-left:10px;margin-right:20px;">
	<div class="navbar-header">
	</div>
	<a href="Home.html" class="navbar-brand"><img alt="Attendance-portal" src="img/menu.png" class="responsive" height="50px" width="90px;"></a>
	<div>
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
<div class="panel panel-success" style="opacity:0.9;margin-top:30px;">
<div class="panel-heading" style="opacity:1;" >
<div class="row">
<hr>
		<center><font size="50px" face="Aerial"><b>
		<% 
String name=(String)session.getAttribute("user");  
out.print("Good Job "+name+"!");  
%>
<hr>
</b></font></center>
</div>
</div>
<div class="panel-body">
<hr>
<center><font size="50px" face="Agency fb"><b>Attendance Submitted successfully</b></font></center>
<hr>
</div>
</div>
</div>
</div>
</body>
</html>