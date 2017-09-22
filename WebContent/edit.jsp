<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/shoppingmall","root","root");
String id = (String)request.getAttribute("editId");
String query = "SELECT * FROM items WHERE id = "+id;
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
if(rs.next()){
	%>
	<form method="post" action="adminProcess">
		<div class="form-group">
			<span class="label-control">Brand:</span>
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
			<input class="form-control" type="submit" value="submit" name="submit"/>
		</div>
	</form>	
<% 
}
%>

</body>
</html>