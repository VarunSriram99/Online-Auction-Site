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
		function validate()
		{
			var username=document.login.username.value;
			var password=document.login.password.value;
			var repassword=document.login.repassword.value;
			if(username.length==0)
			{
				alert("The username shouldn't be empty!");
			}
			if (!username.match(/^[A-Za-z0-9]+$/))
			{
				alert("The username should not contain whitespace or special characters!");
				return false;
			}
			if(password.length==0)
			{
				alert("Password shouldn't be empty!");
				return false;
			}
			if(!(password==repassword))
			{
				alert("Password and Re-Type password doesn't match. Please check again.");
				return false;
			}
		}
	</script>
</head>
<body>
<header>
	<a href="home.html"><img src="http://127.0.0.1:8887/logo.png"></a>
	<!--<span id="logo">Vendeur Auctions</span>-->
</header>
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
    	String name=request.getParameter("name");
    	String username=request.getParameter("username");
    	String password=request.getParameter("password");
    	String email=request.getParameter("email");
    	String type=request.getParameter("type");
    	String id=request.getParameter("id");
    	String check="Select max(id) from "+type+";";
    	System.out.print(check);
    	ResultSet rs=stmt.executeQuery(check);
    	int max=-99;
    	if(rs.next())
    	{
    		max=rs.getInt("max(id)")+1;
    		System.out.println(max);
    	}
    	int flag=0;
    	String uniqueuser="Select username from "+type+";";
    	System.out.print(uniqueuser);
    	rs =stmt.executeQuery(uniqueuser);
    	while(rs.next())
    	{
    		if((rs.getString("username")).equals(username))
    		{
    			out.print("<center>Username already exists!!. Please type a new name!</center>");
    			flag=1;
    		}
    		System.out.println("Executed this");
    	}
    	if(flag==0)
    	{
	    	if(max==-99)
	    	{max=0;}
	    	String sql="Insert into "+type+" values("+max+",'"+username+"','"+name+"','"+email+"','"+id+"','"+password+"');";
	    	System.out.print(sql);
	    	stmt.execute(sql);
	    	out.println("<center>Successfully registered!!</center>");
	    	response.sendRedirect("login.jsp?register=success");
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
<content>
<center><form method="post" name="login" onsubmit="return validate()" action="register.jsp" autocomplete="on">
		<input type="text" name="name" placeholder="Name" required>
		<input type="email" name="email" placeholder="Email" required>
		<input type="text" name="id" placeholder="ID number" required>
		Login type: <label><input type="radio" name="type" value="seller" required>Seller</label>
		<label><input type="radio" name="type" value="buyer" required>Buyer</label>
		<input type="text" name="username" placeholder="Username" required>
		<input type="password" name="password" placeholder="Password" required>
		<input type="password" name="repassword" placeholder="Re-Enter Password" required>
		<input type="submit" name="Login">
	</form>
	</center>
</content>

<footer>
	&#174;Vendeur Auctions- 2020-21.
</footer>
</body>
</html>