<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
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

<title>Add a product</title>
</head>
<body class="container-fluid">
<a href="admin.jsp">Back to item list </a>
<form class="form" action="addItem" method="post">
	<h1 class="text-center">Insert Item</h1>
	<div class="form-group">
		<label class="label-control">Brand:</label>
		<input class="form-control" type="text" name="brand" placeholder="brand name ex. tata" required/>
	</div>
	<div class="form-group">
		<label class="label-control">Name:</label>
		<input class="form-control" type="text" name="name" placeholder="name of product ex. low sodiume" required/>
	</div>	
	<div class="form-group">
	<label class="label-control">Type:</label>
	<input class="form-control" type="text" name="type" placeholder="type ex. salt" required/>
	</div>
	<div class="form-group">
		<label class="label-control">Price Rupees:</label>
		<input class="form-control" type="number" name="price" placeholder="15/-" required/>
	</div>
	<div class="form-group">
		<label class="label-control">Quantity:</label>
		<input class="form-control" type="number" name="quantity" placeholder="quantity ex. 10" required/>
	</div>
	<div class="form-group">
		<label class="label-control">Weight:</label>
		<input class="form-control" type="text" name="weight" placeholder="weight ex. 1kg" required/>
	</div>
	<div class="form-group">
		<label class="label-control">Floor:</label>
		<input class="form-control" type="text" name="floor" placeholder="floor ex. first" required/>
	</div>
	<div class="form-group">
		<label class="label-contrtol">Section:</label>
		<input class="form-control" type="text" name="section" placeholder="section ex Grocery" required/>
	</div>
	<div class="form-group">
		<label class="label-control">Wreck no:</label>
		<input class="form-control" type="text" name="wreck_no" placeholder="wreck no ex. A-21" required/>
	</div>
	<div class="form-group">
		<label class="label-control">Wreck Floor:</label>
		<input class="form-control" type="text" name="wreck_floor" placeholder="Wreck floor ex. second" required/>
	</div>
	<div class="form-group">
		<label class="label-control">Product:</label>
		<input class="form-control" type="text" name="product" placeholder="product ex Tata Salt" required/>
	</div>
	<div class="form-group">
		<label class="label-control">image:</label>
		<input class="form-control" type="text" name="image" placeholder="Image ex images/products/tata-salt" required/>
	</div>
	<div class="form-group">
		<input class="form-control btn btn-primary" type="submit" value="Insert"/>
	</div>
</form>

</body></html>