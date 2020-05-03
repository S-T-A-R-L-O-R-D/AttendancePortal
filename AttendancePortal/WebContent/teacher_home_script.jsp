<html>
<body>
welcome
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
String url="jdbc:mysql://localhost:3306/attendance?useSSL=false";
try {
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loaded");
   Connection con= DriverManager.getConnection(url,"root","star");
    System.out.println("Connection Established");
    Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);  
   String name= (String)session.getAttribute("user");  
     
    String subject="SELECT t_subject_class FROM teachers WHERE t_name='"+name+"'";
    ResultSet result=stmt.executeQuery(subject);
    result.absolute(1);
    
    response.sendRedirect("success.jsp");
    String sub=result.getString(1);
	String[] s=new String[65]; 
    int k=0;
    String query[]=new String[100];
    for(int i=0;i<63;i++)
    {
    	k++;
    s[i]=request.getParameter(Integer.toString(k));
    query[i]="UPDATE "+result.getString(1)+" SET status='"+s[i]+"' WHERE id="+k;
    }
    ResultSet result1=stmt.executeQuery("SELECT delivered FROM "+result.getString(1)+" WHERE id=1");
    result1.absolute(1);
    int delivered=result1.getInt(1);
    delivered++;
    int d_up=stmt.executeUpdate("UPDATE "+sub+" SET delivered="+delivered+" WHERE id=1");
    
   
    for(int i=0;i<63;i++)
    {
    	 int queryexecute=stmt.executeUpdate(query[i]);
    }
    int attended_array[]=new int[65]; 
    int z=0;
    for(int i=0;i<63;i++)
    {
    	z++;
    	ResultSet att=stmt.executeQuery("SELECT attended FROM "+sub+" WHERE id="+z);
    	att.absolute(1);
    	attended_array[i]=att.getInt(1);
    }
    for(int i=0;i<63;i++)
    {
    	if(s[i].equals("present"))
    	{
    		attended_array[i]=attended_array[i]+1;
    	}
    }
    
    int y=0;
    
    for(int i=0;i<63;i++)
    {
    	y++;
    	if(s[i].equals("present"))
    	{
    		int att_up=stmt.executeUpdate("UPDATE "+sub+" SET attended="+attended_array[i]+" WHERE id="+y);
    	}
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