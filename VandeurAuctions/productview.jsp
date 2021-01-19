<%@ page language="java" contentType="text/html"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>Product</title>
<style>
  *{
    font-family: Montserrat;
  }
  body{
    overflow: hidden;
  }
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
  font-size:20px;
  padding:8px;
  margin-top:150px; 
  margin-left:50px;
  
}
h2 {
text-align: center;
overflow: auto;
}
.split {
  height: 100%;
  width: 50%;
  position: relative;
  z-index: 0;
  top: 30px;
  overflow-x: hidden;
  padding-top: 20px;
}

.left {
  left: 0;
  height: 100%;
  transform: translateY(-10vh);
  z-index: -1;


  /*border: solid 2px black;*/
  
}

::-webkit-scrollbar {
  width: 2px;
  height: 3px;
}
::-webkit-scrollbar:hover ::-webkit-scrollbar:focus {
  visibility: visible;

}
/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1;
  width: 2px !important;
  height: 3px;
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: #d0714e;
  width: 2px !important;
  height: 3px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #bf603d;
}
.right {

  position: absolute;
  top: 190px;
  right: 10vh;
  width: 50%;
  height: 50%;
  padding-left: 20px;
  border-left: solid 1px #bf603d;
  /*border: solid 2px black;*/
  }
body
{
 background-color:#e2e8e9;
 }
  button
 {
  border-radius: 70%;
  font-size:20px;
  position: absolute;
  top: 170px;
  right: 5;
  width: 50px;
  height: 50px;
  }
 p
 { font-size: 20px;
   text-align:left;
  position: absolute;
  right: 5;
  width: 100%;
  height: 100px;}
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
	footer :hover {
    opacity:1.0;
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
                #back
    {
      text-align: left;
      background-color: transparent;
      border: none;
      font-size: 18px;
      color: #bf603d;
      z-index: 1;

    }
    form[name=bid]{
      text-align: center;
      display: block;
      position: absolute;
      transform: translateY(350%);
    }
    input[name=newbid]{
      font-size: 16px;
    }
    .right input[type=submit]{
      font-size: 14px;
      background-color: transparent;
      border: 1px solid black;
      border-radius: 5px;
      transition: 0.4s ease-in-out;
      
    }
    .right input[type=submit]:hover{
      background-color: #bf603d;
      color: white;
      
    }
#image{
  width: 50vh;
  height: 50vh;
}

    #warning
    {
      position: absolute;
      top: 0px;width: 100%;
      color: red;
      font-size: 15px;
      transform: translateY(230%);
    }
    #biddet{
      display: block;
      transform: translateY(140%);
      text-align: left;
      font-weight: 500;
    }
    #describe{
      font-weight: 300;
      height: 35%;
      width: 90%;
      overflow-y: auto;
      text-align: justify;
      overflow-x: visible;
      font-size: 15px;
      padding-right: 10px;

    }
</style>
<script type="text/javascript">
  function validate() {
    var bid= document.bid.newbid.value;
    if (!bid.match(/^[0-9.]+$/)) {
      alert("The bid should be a value!");
      return false;
    }
  }
</script>
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
  String itemnum=request.getParameter("item");
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
      String sql="select * from items where itemnum="+itemnum+";";
      ResultSet rs= stmt.executeQuery(sql);
%>
<header>
	<a href="home.html"><img src="http://127.0.0.1:8887/logo.png"></a>
	<!--<span id="logo">Vendeur Auctions</span>-->
</header>
<aside>
  <form method="post" name="logout" action="logout.jsp">
    <input type="submit" value="Logout">    
  </form>
</aside>
<a id="back" href="buyerlogin.jsp">Back</a>
</div>
<div class="split left">
  <%
  double bidold=0.0;
  while(rs.next())
  {
  out.println("<h2>"+rs.getString("itemname")+"</h2><br>");
  out.println("<center><img  src=\"http://127.0.0.1:8887/"+rs.getString("picid")+"\" id=\"image\"></center></div>");
  out.print("<div class=\"split right\">\n<u>Description</u><p id=\"describe\">"+rs.getString("detail")+"</p><div id=\"actualbid\"><p id=\"biddet\">Current bid: "+rs.getString("highbid")+"<br>Highest bidder: "+rs.getString("highbidder")+"</p>");
   bidold=rs.getDouble("highbid"); 
}
String bidvs=request.getParameter("newbid");
if(!(bidvs==null))
{
  double bidv=Double.parseDouble(bidvs);
  if(bidv<=bidold)
  {
    out.println("<p id=\"warning\">(Bid a value higher than the current value!)</p>");
  }
  else{
  sql="update items set highbid="+bidv+" ,highbidder=\'"+username+"\'where itemnum="+itemnum+";";
  stmt.execute(sql);
  sql="insert into i"+itemnum+" values("+bidv+",\'"+username+"\')";
  stmt.execute(sql);
  response.sendRedirect("productview.jsp?item="+itemnum);
}
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
<form method="post" name="bid" action="productview.jsp" onsubmit="validate()">
  <input type="text" name="newbid" placeholder="Type your bid here." required><br><br>
  <%out.println("<input type=\"text\" name=\"item\" value=\""+itemnum+"\" hidden>");%>
  <input type="submit" name="bid" value="Bid">
</form>
</div>
</div>
<footer>
	&#174;Vendeur Auctions- 2020-21.
</footer>
</body>
</html>



 
 
 









