<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<!-- <meta charset="utf-8" http-equiv="refresh" content="2"> -->
	<title>Error</title>
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
		h1{
			color: #bf603d;
			transform: translateY(200px);
		}
		h1 a{
			color: #bf603d;
		}


	</style>
</head>
<body>
<header>
	<a href="home.html"><img src="http://127.0.0.1:8887/logo.png"></a>
	<!--<span id="logo">Vendeur Auctions</span>-->
</header>
<center><h1>Authentication unsuccessful/time-out! Click here to <a href="login.jsp">login</a></h1></center>
<footer>
	&#174;Vendeur Auctions- 2020-21.
</footer>
</body>
</html>