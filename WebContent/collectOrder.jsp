<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Collect Order</title>
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
		margin:10px 10% ;
		padding:5% 10%;
	}
	a{
		color:white;
		font-size:20px;
	}
</style>
</head>
<body class="container-fluid">
<main>
	<%
	String name = request.getParameter("oby_name");
	String token = request.getParameter("name_token");
	String order_id = request.getParameter("o_id");
	String sid = request.getParameter("sid");
	%>
	<h1 class="text-center">Order List for <% out.println(name); %></h1>
	<ul class="row">
		<li class="col-md-4">Name:<% out.println(name); %></li>
		<li class="col-md-4">Id number/Token:<% out.println(token); %></li>
		<li class="col-md-4">Order Id:<% out.println(order_id); %></li>
	</ul>
	<table class="table table-responsive">
	<tr>
		<th>Brand</th>
		<th>Product</th>
		<th>Name</th>
		<th>Weight</th>
		<th>Image</th>
		<th>Location</th>
		<th>Quantity</th>
		<th>Price</th>
	</tr>
	<%
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/shoppingmall","root","root");
		Statement st = conn.createStatement();
		ResultSet rs;
		String items = request.getParameter("list");
		System.out.println(items);
		String[] arr = items.split(",");
		System.out.println(arr[0]);
		int amount = 0;
		for(int i = 0; i < arr.length-1; i+=2){
			String q = "SELECT * FROM items WHERE id = "+arr[i];
			System.out.println(q);
			
			 
			rs = st.executeQuery(q);
			if(rs.next()){
				
				
			double doubleValue = Double.parseDouble(arr[i+1].trim());
			int quantity = (int)doubleValue;
				
			//int quantity = Integer.parseInt(arr[i+1]);
			System.out.println("q:"+quantity);
			amount = amount + (rs.getInt("price") * quantity);
			%>
				<tr>
					<td><% out.println(rs.getString("brand")); %></td>
					<td><% out.println(rs.getString("product")); %></td>
					<td><% out.println(rs.getString("name")); %></td>
					<td><% out.println(rs.getString("weight")); %></td>
					<td><img src="<% out.println(rs.getString("image")); %>.png" style="max-width:150px;max-height:150px;" class="img-responsive" /></td>
					<td><% out.println(rs.getString("floor")); %> Floor, <% out.println(rs.getString("section")); %> section, wreck number <% out.println(rs.getString("wreck_no")); %>, wreck floor <% out.println(rs.getString("wreck_floor")); %></td>
					<td>x<% out.println(arr[i+1]); %></td>
					<td><% out.println(rs.getInt("price")); %>x<% out.println(arr[i+1]); %></td>
				</tr>		
			<%
			}%>
			
			
		<%
		}
		%>
		<tr><td colspan="8">Total: <% out.println(amount); %></td></tr>
	</table>
	<div class="row">
		<div class="col-md-12">
			<hr>
		</div>
	</div>
	<form class="form" method="post" action="staff.jsp">
		<input type="hidden" name="o_name" value="<% out.println(name); %>"/>
		<input type="hidden" name="amount" value="<% out.println(amount); %>"/>
		<div class="form-group">
			<label class="label-control">On which counter number?</label>
			<input type="hidden" name="staff_id" value="<% out.println(sid); %>"/>
			<input type="hidden" name="order_id" value="<% out.println(order_id); %>"/>
			<input class="form-control" type="text" name="counter_numetr" required placeholder="example A"/>
		</div>
		<button class="form-control btn btn-primary" type="submit" name="notify">Notify <% out.println(name); %> for collection</button>
	</form>
	</main>
</body>
</html>