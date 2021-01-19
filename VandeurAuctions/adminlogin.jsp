<!DOCTYPE html>
<html>
<head>
	<!-- <meta charset="utf-8" http-equiv="refresh" content="2"> -->
	<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 
	<META HTTP-EQUIV="Expires" CONTENT="-1">
	<title>Admin</title>
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
		content input[type=submit]
		{
			background-color: transparent;
			border: solid 2px #bf603d;
			margin: 5px;
			padding: 3px;
			font-size: 18px;
			border-radius: 5px;
			transition: 0.4s ease-in-out;
		}
		content input[type=submit]:hover
		{
			background-color: #bf603d;
			color:white;
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
<center><h3>Admin Login</h3></center>
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
	
String logout=request.getParameter("logout");

String view=request.getParameter("view");
if(view!=null)
{
	if(view.equals("Users"))
	{
		response.sendRedirect("adminviewusers.jsp");
	}
	if(view.equals("Products"))
	{
		response.sendRedirect("adminviewitems.jsp");
	}
}
%>
<br>
<content>
	<center>
		<form method="post" action="adminlogin.jsp">
			<input type="submit" name="view" value="Users"><br>
			<input type="submit" name="view" value="Products">
		</form>
	</center>
</content>

<footer>
	&#174;Vendeur Auctions- 2020-21.
</footer>
</body>
</html>