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
<title>Staff page</title>
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
		margin:10px 15% ;
		padding:5% 10%;
	}
	a{
		color:white;
		font-size:20px;
	}
</style>
</head>
<body class="container-fluid">
<a href="index.jsp">Log Out</a>
	<main>
	<h1 class="text-center">Welcome <% out.println((String)request.getAttribute("name")); %></h1>
	
		<% 
			String staff_id = (String)request.getAttribute("id");
			Connection  conn = DriverManager.getConnection("jdbc:mysql://localhost/shoppingmall","root","root");
			Statement st = conn.createStatement();
			String q = "SELECT * FROM orders WHERE staff_id = "+ staff_id+" AND completed = 0";
			ResultSet rs = st.executeQuery(q);
			String staff_name = (String)request.getAttribute("name");
			System.out.println("staff.jsp:- staff_name="+staff_name);
			int i = 1;
			while(rs.next()){
		%>
				<form class="form" action="collectOrder.jsp" method="post">
				<table class="table table-responsive" border="1">
				<tr>
					<th>Sr no.</th>
					<th>Order name</th>
					<th>Name token Id</th>
					<th>Order Id</th>
					<th>Process Order</th>
				</tr>
				<tr>
					<td><% out.println(i++); %></td>
					<td><input type="hidden" name="oby_name" value="<% out.println(rs.getString("order_name")); %>"/><% out.println(rs.getString("order_name")); %></td>
					<td><input type="hidden" name="name_token" value="<% out.println(rs.getInt("token_id")); %>"/><% out.println(rs.getString("token_id")); %></td>
					<td><input type="hidden" name="o_id" value="<% out.println(rs.getInt("id")); %>"/><% out.println(rs.getInt("id")); %></td>
					<td><input type="hidden" name="staff_name" value="<% out.println(staff_name); %>"/><input type="hidden" name="sid" value="<%out.println(staff_id);%>"/><input type="hidden" name="list" value="<% out.println(rs.getString("items")); %>"/><input class="btn btn-success" value="preapre order" type="submit"/></td>
				</tr>
				</table>
				</form>
		
		<%
				
			}
		%>
		</main>
</body>
</html>