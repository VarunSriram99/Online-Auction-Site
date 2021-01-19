<%@ page language="java" contentType="text/html"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<!-- <meta charset="utf-8" http-equiv="refresh" content="2"> -->
	<title>Register</title>
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
			left: 50px;
			width: 12%;
			height: 110%;
		}
		content
		{
			padding: 20px;
			position: absolute;
			display: block;
			width: 100%;
			left: 1%;
			text-align: justify;
		}
		#about
		{
			width: 40%;
		}
/*		content a{
			text-align: center;
			text-decoration: none;
			color: black;
			padding: 15px;
			border: none 1px black;
			border-radius: 20%;
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
			
		}
		content a:hover, content a:focus{
			background-color: #bf603d;
			color: white;
		}*/
		content img{
			position: absolute;
			display: inline;
			right:70px;
			top: 0px;
			width: 52%;
			height: 100%;
			
		}
		content image:before{
			box-shadow:inset 0px 0px 3px 1px rgba(0,0,0,1);
		}
		label, label input{
			display: inline-block;
		}

		input{
			font-family: arial;
			display: block;
			font-size: 18px;
			color: #bf603d;
			margin: 5px;
			text-align: center;
			align-self: center;
			border-radius: 5px;
			border: solid 1px black;
			outline: none;
			transition: 0.4s ease-in-out;
		}
		input[type=text]:hover, input[type=password]:hover, input[type=email]:hover{
			border:solid 1px #bf603d;
		}
		input[type=text]:focus, input[type=password]:focus, input[type=email]:focus{
			border:solid 2px;
		}
		input[type=submit]{
			background-color: #bbbbbb33;
			border-radius: 20px;
			color: black;
			font-family: Montserrat;
			transition: 0.4s ease-in-out;
		}
		input[type=submit]:hover,input[type=submit]:focus{
			background-color: #bf603d;
			color: white;
		}
		content a{
			text-decoration: none;
			color:#bf603d;
		}

	</style>
	<script type="text/javascript">
		let formData = new FormData()
		formData.append(‘itemname’, itemname)
		formData.append(‘details’, details)
		formData.append(‘file’, file)
	</script>
</head>
<body>
<header>
	<a href="home.html"><img src="http://127.0.0.1:8887/logo.png"></a>
	<!--<span id="logo">Vendeur Auctions</span>-->
</header>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
String username=(String)session.getAttribute("username");
String type=(String)session.getAttribute("type");
if(username==null || !(type.equals("seller")))
	response.sendError(403);
else
	out.print("<center>Welcome "+username+"!</center>");
%>
<content>
<center><form method="post" name="login" action="fileuploadscript.jsp" autocomplete="on" enctype="multipart/form-data" id="login">
		<input type="text" name="itemname" placeholder="Item Name" required>
		<textarea form="login" name="details" placeholder="Write description about the product" cols="20" rows="5" required></textarea>
		<br><p><u>Add picture(less than 5MB)</u></p><input type="file" name="file"  required />
		<br/>
		<input type="submit" name="Login">
	</form>
	</center>
</content>

<footer>
	&#174;Vendeur Auctions- 2020-21.
</footer>
</body>
</html>