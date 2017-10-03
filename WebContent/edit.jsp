<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Edit item</title>
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
	a{
		color:white;
		font-size:20px;
	}
	form{
		margin:10px 15% ;
		padding:1% 10%;
		background:rgba(0,0,0,0.7);
	}
</style>
</head>
<body class="container-fluid">
<main>

<%
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/shoppingmall","root","root");
String id = (String)request.getAttribute("editId");
String query = "SELECT * FROM items WHERE id = "+id;
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
if(rs.next()){
	%>
	<form class="form" method="post" action="adminProcess">
		<h1 class="text-center">Edit Item</h1>
		<div class="form-group">
			<label class="label-control">Brand:</label>
			<input class="form-control" type="text" value="<% out.println(rs.getString("brand")); %>" name="brand"/>
		</div>
		<div class="form-group">
			<span class="label-control">Name:</span>
			<input class="form-control" type="text" value="<% out.println(rs.getString("name")); %>" name="name"/>
		</div>
		<div class="form-group">
			<span class="label-control">Type:</span>
			<input class="form-control" type="text" value="<% out.println(rs.getString("type")); %>" name="type"/>
		</div>
		<div class="form-group">
			<span class="label-control">Price:</span>
			<input class="form-control" type="text" value="<% out.println(rs.getInt("price")); %>" name="price"/>
		</div>
		<div class="form-group">
			<span class="label-control">Quantity:</span>
			<input class="form-control" type="text" value="<% out.println(rs.getInt("quantity")); %>" name="quantity"/>
		</div>
		<div class="form-group">
			<span class="label-control">Weight:</span>
			<input class="form-control" type="text" value="<% out.println(rs.getString("weight")); %>" name="weight"/>
		</div>
		<div class="form-group">
			<span class="label-control">Floor:</span>
			<input class="form-control" type="text" value="<% out.println(rs.getString("floor")); %>" name="floor"/>
		</div>
		<div class="form-group">
			<span class="label-control">Section:</span>
			<input class="form-control" type="text" value="<% out.println(rs.getString("section")); %>" name="section"/>
		</div>
		<div class="form-group">
			<span class="label-control">Wreck no</span>
			<input class="form-control" type="text" value="<% out.println(rs.getString("wreck_no")); %>" name="wreck_no"/>
		</div>
		<div class="form-group">
			<span class="label-control">Wreck Floor</span>
			<input class="form-control" type="text" value="<% out.println(rs.getString("wreck_floor")); %>" name="wreck_floor"/>
		</div>
		<div class="form-group">
			<span class="label-control">Product</span>
			<input class="form-control" type="text" value="<% out.println(rs.getString("product")); %>" name="product"/>
		</div>
		<div class="form-group">
			<span class="label-control">Image</span>
			<input class="form-control" type="text" value="<% out.println(rs.getString("image")); %>" name="image"/>
		</div>
		<div class="form-group">
			<input class="form-control" type="hidden" value="naren" name="formEditFilled"/>
			<input type="hidden" value="<% out.println(rs.getInt("id")); %>" name="id"/>
		</div>
		<div class="form-group">
			<input class="form-control btn btn-primary" type="submit" value="submit" name="submit"/>
		</div>
	</form>	
<% 
}
%>
</main>
</body>
</html>