<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="js/artyom.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to Shopping Mall</title>
<style>
	body
	{
		background-image: url('images/mall.jpg');
		background-repeat: no-repeat;
		background-size: cover;
		color: white;
	}
	.btn-black{
		background:black;
		border:0px;
		padding:10px 45px;
		color:white;
	}
	.text{
		background: rgba(0,0,0,0.2);
		color:white;
		height:40px;
	}
	.catalog{
		background-color:rgba(0,0,0,0.5);
		background-origin: content-box;
		padding: 30px;
		margin: 10px 1px;
	}
	
	@media only screen and (min-width: 1025px)
	{
		.catalog{
			margin:100px 25%;
		}
	}
</style>
</head>
<body class="container-fluid">
	<div class="col-md-6 catalog text-center">
		<h1>Welcome to the Shopping Mall!</h1>
		<br><br>
		<form class="form" method="post" action="login">
			<div class="form-group text-left">
			<label class="h4 label-control">Enter Your Name</label>
			<input class="form-control" required type="text" placeholder="Enter your Name" name="name"/>
			</div>
			<div class="text-left form-group">
			<label class="h4 label-control">Enter the token number</label>
			<input class="form-control" required type="text" placeholder="Enter your token number" name="token"/>
			</div>
			<span>
				<input class="btn btn-default btn-black" type="submit" value="Login" />
			</span>
		</form>
	</div>
</body>
</html>