<%@ page language="java" contentType="text/html"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<html>
<head>
	<title>Products</title>
<style>
table {
  text-align: center;
  font-family: Arial, Helvetica, sans-serif;
  position:relative;
  top:-50px;
  
}

td {
  padding-bottom: 20px;
  font-size:20px;
  width: 33.33%;
  
}

img {
  width: 200px;
  height: 200px;
}

h1 {
    text-align: center;
  font-family: Montserrat,helvetica;
  }
  body
  {
  background-color:#e2e8e9;
  overflow: auto;
  font-family: Montserrat,helvetica}
 button
 {
  border-radius: 70%;
  font-size:20px;
  }
  
 .container {
  position: relative;
  width: 100%;
  border: 1px solid black;
  border-radius: 20px;
  padding: 2%;
}
.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  color: #00000000;
  transition: .5s ease;
  
}
.link{
	text-decoration: none;
	color: black;
}
.text {
  color: white;
  font-size: 20px;
  position: absolute;
  top: 10%;
  left: 50%;
  width: 100%;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  text-align: center;
  color: #00000000;
  transition: .5s ease;
}
.container:hover .overlay {
  background-color: #9fb7e055;
}
.container:hover .text{
	color:#ffffffff;
	background-color: #bf603dcc;
}
header
		{
			background-color: #bf603d;
			width: 101.5%;
			height:100px;
			color: white;
			position: relative;
			left: -8px;
			top: -8px;
			display: block;
			text-align: center;
			vertical-align: middle;
		}
		

  footer
		{
			position: relative;
			bottom: -20px;
			width: 100%;
			height: 5%;
			text-align: center;
			font-weight: 500;
			background-color: #00000022;
			left: 0px;
			padding: 5px;
		}

		header img{
			position: relative;
			top: 15px;
			left: 0px;
			width: 10%;
			height: 110%;
		}
				aside
		{
			text-align: right;
		}
		aside input[type=submit]
		{
			background-color: transparent;
			border: none;
			font-size: 18px;
			color: #bf603d;
		}
</style>
</head>
<body>
	<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	String username=(String)session.getAttribute("username");
	String type=(String)session.getAttribute("type");
	if(username==null || !(type.equals("buyer")))
		response.sendError(403);
	%>
<header>
	<a href="home.html"><img src="http://127.0.0.1:8887/logo.png"></a>
	<!--<span id="logo">Vendeur Auctions</span>-->
</header>
<aside>
	<form method="post" action="logout.jsp">
		<input type="submit" value="Logout">		
	</form>
</aside>
<h1>Start Bidding!</h1>
<table cellpadding="20" cellspacing="80" width="100%">
	<tr>
<%
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	final String DB_URL = "jdbc:mysql://localhost/auction";
	final String USER = "user";
    final String PASS = "Robo@2010";
    Connection conn = null;
    Statement stmt = null;
	try
    {
    	Class.forName(JDBC_DRIVER);
    	System.out.println("Connecting to Database");
    	conn = DriverManager.getConnection(DB_URL,USER,PASS);
    	System.out.println("Creating statement...");
    	stmt = conn.createStatement();
    	String sql="select * from items order by itemnum;";
    	ResultSet rs= stmt.executeQuery(sql);
    	int counter=0;
    	while(rs.next())
    	{
    		counter++;
    		out.println("");
    		out.println("<td><a class=\"link\" href=\"productview.jsp?item="+rs.getString("itemnum")+"\">"+"<div class=\"container\">");
    		
    		out.println("<img src=\"http://127.0.0.1:8887/"+rs.getString("picid")+"\">"+"<br/>&nbsp;&nbsp;"+rs.getString("itemname")+"<div class=\"overlay\">");
    		out.println("<div class=\"text\">View Product Details</div></div></div></a></td>");
    		if(counter%3==0)
    			out.println("</tr><tr>");
    	}
    }
    catch(SQLException se)
    {
    //Handle errors for JDBC
      se.printStackTrace();
    }
    catch(Exception e)
    {
    //Handle errors for Class.forName
      e.printStackTrace();
    }
    finally
    {
    //finally block used to close resources
      try
      {
        if(stmt!=null)
          stmt.close();
      }
      catch(SQLException se2)
      {
      }// nothing we can do
      try
      {
        if(conn!=null)
          conn.close();
      }
      catch(SQLException se)
      {
        se.printStackTrace();
      }//end finally try
    }
%>
</tr>
</table>
<footer>
	&#174;Vendeur Auctions- 2020-21.
</footer>
</body>
</html>