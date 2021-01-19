<!DOCTYPE html>
<html>
<head>
	<!-- <meta charset="utf-8" http-equiv="refresh" content="2"> -->
	<title>Home</title>
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
			height:100px;
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
			width: 10%;
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
		content a{
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
			
		}
		content a:hover, content a:focus{
			background-color: #bf603d;
			color: white;
		}
		content img{
			position: absolute;
			display: inline;
			right:70px;
			top: 0px;
			width: 52%;
			height: 100%;
			
		}
	</style>
</head>
<body>
<header>
	<a href="home.html"><img src="http://127.0.0.1:8887/logo.png"></a>
	<!--<span id="logo">Vendeur Auctions</span>-->
</header>
<content>
	<img src="http://127.0.0.1:8887/homeimage.png">
	<div id= "about">
	<h4><u>About</u></h4>
	<p>Vendeur Auctions is a website in India that lists all the items that are for sale. We list all the items that are scheduled to be auctioned</p>

<p>Buyers can search for any kind of item that is for auction in India. All the information at one place gives them a choice to buy an item of their liking and to make a well informed decision. They will get to know the basic details of the item. Our user friendly interface makes the process of searching for an item a lot more easier and informative.</p>

<p>Vendeur Auctions is committed to provide a win-win situation for both the buyers and sellers.</p>
	<center><span id="seperator">
	<a href="login.jsp">Login</a>
	<a href="register.jsp">Register</a>
	</span></center>
	</div>
</content>

<footer>
	&#174;Vendeur Auctions- 2020-21.
</footer>
</body>
</html>