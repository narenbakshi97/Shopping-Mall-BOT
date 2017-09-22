<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a product</title>
</head>
<body>
<h1>Insert Item</h1>
<form action="addItem" method="post">
<table>
<tr><td>Brand:</td><td><input type="text" name="brand"/></td></tr>
<tr><td>Name:</td><td><input type="text" name="name"/></td></tr>
<tr><td>Type:</td><td><input type="text" name="type"/></td></tr>
<tr><td>Price Rupees:</td><td><input type="number" name="price"/></td></tr>
<tr><td>Quantity:</td><td><input type="number" name="quantity"/></td></tr>
<tr><td>Weight:</td><td><input type="text" name="weight"/></td></tr>
<tr><td>Floor:</td><td><input type="text" name="floor"/></td></tr>
<tr><td>Section:</td><td><input type="text" name="section"/></td></tr>
<tr><td>Wreck no:</td><td><input type="text" name="wreck_no"/></td></tr>
<tr><td>Wreck Floor:</td><td><input type="text" name="wreck_floor"/></td></tr>
<tr><td>Product:</td><td><input type="text" name="product"/></td></tr>
<tr><td>image:</td><td><input type="text" name="image"/></td></tr>
<tr><td><input type="submit" value="Insert"/></td></tr>
</table>
</form>

<br><br><a href="admin.jsp">Back to item list </a>

</body>
</html>