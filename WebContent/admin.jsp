<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Page</title>
<style>
	body
	{
		background-image: url('images/mall.jpg');
		background-repeat: no-repeat;
		background-attachment:fixed;
		background-size: cover;
		color: white;
	}
	ul{
		list-style-type: none;
	}
	main{
		background:rgba(0,0,0,0.7);
	}
	a{
		color:white;
		font-size:20px;
	}
</style>
</head>
<body class="container-fluid">
	<main class="row">
		<h1 class="text-center">Welcome Admin</h1>
		<ul class="col-md-12">
			<li class="text-center col-md-3"><a href="index.jsp">Log Out</a></li>
			<li class="text-center col-md-3"><a href="insert.jsp">Insert item</a></li>
			<li class="text-center col-md-3"><a href="staffManage.jsp">Manage Staff</a></li>
			<li class="text-center col-md-3"><a href="offerManage.jsp">Manage Offers</a></li>
		</ul>
		
		<table class="table table-responsive"  border="1">
			<tr>
				<td>Index</td>
				<td>Brand</td>
				<td>Name</td>
				<td>Type</td>
				<td>Price</td>
				<td>Quantity</td>
				<td>Weight</td>
				<td>Floor</td>
				<td>Section</td>
				<td>Wreck no</td>
				<td>Wreck floor</td>
				<td>Product</td>
				<td>image</td>
				<td>Operation</td>
			</tr>
			 <%
			   try
			   {
				   int i = 1;
			       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/shoppingmall","root","root");
			       String query="select * from items";
			       Statement stmt=conn.createStatement();
			       ResultSet rs=stmt.executeQuery(query);
			       while(rs.next())
			       {
			   %>
			   			<tr>
			   				<td><% out.println(i++); %></td>
			   				<td><% out.println(rs.getString("brand")); %></td>
			   				<td><% out.println(rs.getString("name")); %></td>
			   				<td><% out.println(rs.getString("type")); %></td>
			   				<td><% out.println(rs.getInt("price")); %></td>
			   				<td><% out.println(rs.getInt("quantity")); %></td>
			   				<td><% out.println(rs.getString("weight")); %></td>
			   				<td><% out.println(rs.getString("floor")); %></td>
			   				<td><% out.println(rs.getString("section")); %></td>
			   				<td><% out.println(rs.getString("wreck_no")); %></td>
			   				<td><% out.println(rs.getString("wreck_floor")); %></td>
			   				<td><% out.println(rs.getString("product")); %></td>
			   				<td><img style='max-width:50px;max-height:50px;' src="<% out.println(rs.getString("image")); %>.png" class="img-responsive"/></td>
			   				<td><form action="adminProcess" method="post"><input type="hidden" name="idEdit" value="<% out.println(rs.getInt("id"));%>"/><input class="btn btn-success" type="submit" value="Edit"/></form><form method="post" action="adminProcess"><input type="hidden" name="idDelete" value="<% out.println(rs.getInt("id"));%>"/><input class="btn btn-danger" type="submit" value="Delete"/></form></td>
			   			</tr>
			   <%
			       }
			   }
			 catch(Exception e){
				 System.err.print(e);
			 }
			   %>
		</table>
	</main>
</body>
</html>