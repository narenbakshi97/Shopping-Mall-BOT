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
<title>Manage Staff</title>
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
	<main>
		<section>
			<h1 class="text-center">Add Staff</h1>
			<form class="form" method="post" action="adminProcess">
				<div class="row">
					<div class="col-md-9">
						<label class="label-control">Name:</label>
						<input type="text" name="staffName" class="form-control" placeholder="Staff member Name" required/>
					</div>
					<div class="col-md-3" style="margin-top:25px;">
						<input class="btn btn-primary" type="submit" value="submit"/>
					</div>
				</div>
			</form>
		</section>
		<section>
		<h3 class="text-center col-md-12">Staff Entries</h3>
		<table class="table table-responsive" border="1">
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Tasks</th>
			</tr>
			<% 
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/shoppingmall","root","root");
				Statement st = conn.createStatement();
				String q = "SELECT * FROM staff";
				ResultSet rs = st.executeQuery(q);
				while(rs.next()){
			%>
				<tr>
					<td><% out.println(rs.getInt("id")); %></td>
					<td><% out.println(rs.getString("name")); %></td>
					<td><% out.println(rs.getInt("tasks")); %></td>
				</tr>		
			<% 
				}
			%>
			</table>
		</section>
		<section>
			<a href="admin.jsp">Back to admin main page</a>
		</section>
	</main>
</body>
</html>