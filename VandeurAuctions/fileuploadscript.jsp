<%@ page import="java.io.*,java.util.*, javax.servlet.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
String sname=(String)session.getAttribute("username");
String type=(String)session.getAttribute("type");
if(sname==null || !(type.equals("seller")))
  response.sendError(403);
final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
final String DB_URL = "jdbc:mysql://localhost/auction";
final String USER = "user";
final String PASS = "Robo@2010";
Connection conn = null;
Statement stmt = null;
String picid="";
File file ;
System.out.println("reached");
      String itemname="";
      String details="";
int maxFileSize = 5000 * 1024;
int maxMemSize = 5000 * 1024;
String filePath = "F:\\study material\\WAD Lab\\WAD LAB MINI PROJECT";
String contentType = request.getContentType();
if ((contentType.indexOf("multipart/form-data") >= 0)) {
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setSizeThreshold(maxMemSize);
factory.setRepository(new File("c:\\temp"));
ServletFileUpload upload = new ServletFileUpload(factory);
upload.setSizeMax( maxFileSize );
try{
List fileItems = upload.parseRequest(request);
Iterator i = fileItems.iterator();
while ( i.hasNext () )
{
FileItem fi = (FileItem)i.next();
if ( !fi.isFormField () ) 
{
String fieldName = fi.getFieldName();
String fileName = fi.getName();
if(fileName.length()>50)
picid=fileName.substring((fileName.length()-49),fileName.length());
else
picid=fileName;
fileName=picid;
System.out.println(fileName+"="+picid+"reached");
boolean isInMemory = fi.isInMemory();
long sizeInBytes = fi.getSize();
file = new File( filePath + "/"+fileName) ;
fi.write( file ) ;
out.println("Uploaded Filename: " + filePath + "/" + fileName + "<br>");
}
else
{
String tempo_name=fi.getFieldName();
String tempo_value=fi.getString();
if(tempo_name.equals("itemname"))
  itemname=tempo_value;
if(tempo_name.equals("details"))
  details=tempo_value;
}
}
}catch(Exception ex) {
System.out.println(ex);
}
}else{
out.println("Error in file upload.");
}
try
    {
    	Class.forName(JDBC_DRIVER);
    	System.out.println("Connecting to Database");
    	conn = DriverManager.getConnection(DB_URL,USER,PASS);
    	System.out.println("Creating statement...");
    	stmt = conn.createStatement();
    	int highbid=0;
    	String highbidder="";
    	String check="Select max(itemnum) from items;";
    	System.out.print(check);
    	ResultSet rs=stmt.executeQuery(check);
    	int max=-99;
    	if(rs.next())
    	{
    		max=rs.getInt("max(itemnum)")+1;
    		System.out.println(max);
    	}
	    	if(max==-99)
	    	{max=0;}
	    	String sql="Insert into items values("+max+",\'"+itemname+"\',\'"+picid+"\',\'"+sname+"\',\'"+details+"\',"+highbid+",\'\');";
	    	System.out.print(sql);
	    	stmt.execute(sql);
        sql="create table i"+max+"(bid double, bidder varchar(20));";
        stmt.execute(sql);
	    	response.sendRedirect("sellerlogin.jsp?register=success");
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