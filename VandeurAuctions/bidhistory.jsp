<%@ page language="java" contentType="text/html"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>

	<title>Bid history</title>
	<style type="text/css">
		*
		{
			font-family: Montserrat,helvetica;
		}

		body
		{
			overflow: hidden;
		}
		header
		{
			background-color: #bf603d;
			width: 101.5%;
			height:130px;
			color: white;
			position: relative;
			left: -8px;
			top: -8px;
			display: block;
			text-align: center;
			vertical-align: middle;
		}
		#seperator 
		{
			font-size: 20px;
			/*position: relative;*/
			text-align: center;
			padding: 30px;
			/*top: 30px;*/

		}
		footer
		{
			position: absolute;
			bottom: 0px;
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
			width: 12%;
			height: 110%;
		}
		content
		{
			padding: 20px;
			position: relative;
/*			display: block;*/
			width: 100%;
		}
		#about
		{
			width: 40%;
		}
		/*content a{
			text-align: center;
			text-decoration: none;
			color: black;
			padding: 15px;
			border: none 1px black;
			border-radius: 20px;
			display: block;
			margin: 5px;
			margin-left: 30px;
			margin-right: 30px; 
			top: 50px;
			position: relative;
			left: 120px;
			width: 200px;
			background-color: #bf603d22;
			transition: background-color 0.4s ease-in-out;
			
		}*/
/*		content a:hover, content a:focus{
			background-color: #bf603d;
			color: white;
		}*/
		h3{
			color: #bf603d;
			text-decoration: underline;
		}
/*		content img{
			position: absolute;
			display: inline;
			right:70px;
			top: 0px;
			width: 52%;
			height: 100%;
			
		}*/
		content input[type=submit]
		{
			background-color: transparent;
			border: solid 1px #bf603d;
			border-radius: 5px;
			font-size: 18px;
			padding: 5px;
			transition: 0.4s ease-in-out;
		}
		content input[type=submit]:hover
		{
			background-color: #bf603d;
			color:white;
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
		table 
		{
  			border-collapse: collapse;
  			width: 100%;
  			border-radius: 5px;
		}
		th, td 
		{
 			 text-align: left;
 			 padding: 8px;
 			 text-align: center;
 			 border: solid 1px black;
 			 border-radius: 5px;
		}
		th:nth-child(even)
		{
			background-color: #fae2d9;
		}
		td:nth-child(even)
		{
			background-color: #fae2d9;
		}
	</style>
</head>
<body>
<header>
	<a href="home.html"><img src="http://127.0.0.1:8887/logo.png"></a>
	<!--<span id="logo">Vendeur Auctions</span>-->
</header>
<aside>
	<form method="post" action="logout.jsp">
		<input type="submit" value="Logout">		
	</form>
</aside>
<center><h3>View/Edit Items</h3></center>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
String username=(String)session.getAttribute("username");
String type=(String)session.getAttribute("type");
if(username==null || !(type.equals("admin")))
	response.sendError(403);
else
	out.print("<center>Welcome "+username+"!</center>");
String item=request.getParameter("item");
out.println("<center><h1>Item "+item+" bid history.</h1></center>");
%>
<br>
<content>
		<table>
			<tr>
			<th>Bid value</th>
			<th>Bidder</th>
			</tr>
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
    	String sql="select * from "+item+" order by bid desc;";
    	ResultSet rs= stmt.executeQuery(sql);
    	while(rs.next())
    	{
    		out.println("<tr><td>"+rs.getString("bid")+"</td><td>"+rs.getString("bidder")+"</td></tr>");
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
</table>
<br>
</content>

<footer>
	&#174;Vendeur Auctions- 2020-21.
</footer>
</body>
</html>