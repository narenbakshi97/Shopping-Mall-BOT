<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Staff</title>
</head>
<body>
	<main>
		<section>
			<h3>Add Staff</h3>
			<form method="post" action="adminProcess">
				<div class="form-group">
					<span class="label-control">Name:</span>
					<input type="text" name="staffName" class="form-control" placeholder="Staff member Name"/>
				</div>
				<div>
					<input type="submit" value="submit"/>
				</div>
			</form>
		</section>
		<section>
		<h3>Staff Entries</h3>
		<table>
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