<%@ page language="java" contentType="text/html"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>Seller</title>
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
<center><h3>Seller</h3></center>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
String username=(String)session.getAttribute("username");
String type=(String)session.getAttribute("type");
if(username==null || !(type.equals("seller")))
{
	response.sendError(403);
}
else
	out.print("<center>Welcome "+username+"!</center>");
	
%>
<br>
<center><h2>Your Products</h2></center>
<content>
	<form method="post" action="sellerlogin.jsp">
		<table>
			<tr>
			<th> </th>
			<th>Item Name</th>
			<th>Seller Name</th>
			<th>Highest Bid</th>
			<th>Highest Bidder</th>
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
    	String sql="select * from items where sname like \'"+username+"\';";
    	System.out.println(sql);
    	ResultSet rs= stmt.executeQuery(sql);
    	while(rs.next())
    	{
    		out.print("<tr><td><input type=\"checkbox\" name=\"item\" value=\""+rs.getString("itemnum")+"\"></td>");
    		out.print("<td>"+rs.getString("itemname")+"</td>");
    		out.print("<td>"+rs.getString("Sname")+"</td>");
    		out.print("<td>"+rs.getString("highbid")+"</td>");
    		out.print("<td>"+rs.getString("highbidder")+"</td></tr>");
    	}
    	System.out.println("Reached 228");
    	String[] items=request.getParameterValues("item");
    	System.out.println("Reached 230");
		String delsqli="(";
		String dropt="";
		System.out.println("Reached 232");
		if(!(items==null) || (request.getParameter("operation").equals("Delete")))
		{
			for(String s: items)
			{
				delsqli+=s+",";
				dropt+="i"+s+",";
			}
			System.out.println("Reached 239");
			dropt="drop table if exists "+dropt.substring(0,(delsqli.length()-1))+";";
			delsqli=delsqli.substring(0,(delsqli.length()-1))+")";
			System.out.println("Reached 241");
			if(!(delsqli.equals(")")))
			{
				delsqli="delete from items where itemnum in "+delsqli;
				System.out.println(delsqli);
				stmt.execute(delsqli);
				stmt.execute(dropt);
			}
			response.sendRedirect("sellerlogin.jsp");
		}
		System.out.println("Reached 250");
		if(request.getParameter("operation").equals("Add new Product"))
		{
			response.sendRedirect("selleradditem.jsp");
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
<input type="submit" name="operation" value="Delete">
<input type="submit" name="operation" value="Add new Product">
</form>
</content>

<footer>
	&#174;Vendeur Auctions- 2020-21.
</footer>
</body>
</html>