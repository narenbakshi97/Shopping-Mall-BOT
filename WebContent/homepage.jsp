<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/artyom.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>		

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Home Page</title>
	<style>

	.robot{
		border:2px solid #059;
		background:white;
	}

	.user{
		border:2px solid #095;
		background:white;
	}

	.chat{
		padding: 5px;
		border-radius:10px;
	}
		
		
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
<body class="container-fluid" onload="myFunction()">
		<div>
		<section id="header" class="navbar bg-primary navbar-fixed-top">
			<h3>Shopping Mall BOT</h3>
		</section>
		<br><br><br>
		</div>


		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-12">

			<canvas id="canvas" width="400" height="500"></canvas>
			
			</div>
		
			<section style="overflow-y:scroll;height: 600px;" id="history" class="messages col-lg-8 col-md-8 col-sm-12">
		</section>
		
		<br><br><br>
		</div>
		
		<section style="padding:10px;" id="footer" class="col-md-12 navbar bg-danger navbar-fixed-bottom">
			<input readonly style="background:transparent;border:white solid;height:35px;font-size:25px;font-family:verdana;" class="col-lg-11 col-md-11 col-xs-10" type="search" id="search"/>
			<i id="mike" onmousedown="proceed()" onmouseup="analyze()" class="col-lg-1 col-md-1 col-xs-2 fa fa-microphone fa-3x"></i>
		</section>

	</body>
	<%
    String myVar = (String)request.getAttribute("name");
	String token = (String)request.getAttribute("token");
	//session.setAttribute( "session_name", myVar );
	//session.setAttribute( "session_token", token );
	%>
	<script src="js/init.js"></script>
	<script src="js/functionality.js"></script>
	<script>
	var name = "<%=myVar%>";
	var token = "<%=token%>";
	artyom.initialize({
        lang:"hi-IN", // Start recognizing
        debug:false, // Show everything in the console
        speed:1 // talk normally
    	}).then(function(){
        	console.log("Ready to speak !");
    	});
	
	
	window.onload = function(){
    	var say = false;
        // Add the error listeners
        
        artyom.when("ERROR",function(err){
            console.error("An error ocurred : ", err.code);
        });        console.log("Artyom is ready");
        var message = "Hello "+name+"! I am Shoppy, Your personal shopping assistant. How can I help you?";
        artyom.say(message);
        artyom.say("To see the commands scroll down, the question and answer history will be stored only for your reference purpose. After you sign out it will be deleted.");
        setTimeout(function(){ history_string("<table><tr><th>Commands</th></tr><tr><td><b>Where can i find *item:</b> <small>shows you location</small></td></tr><tr><td><b>Make a list:</b> <small>Guides you to use list</small></td></tr><tr><td><b>Add *item:</b> <small>Adds *item</small></td></tr><tr><td><b>Remove *item:</b> <small>removes *item</small></td></tr><tr><td><b>number *</b><small>To choose an item from the index</small></td></tr><tr><td><b>quantity *</b><small>To give the quantity of the item</small></td></tr><tr><td><b>change quantity</b><small>Changes quantity of an existing item in list (used along with number command for item selection)</small></td></tr><tr><td><b>yes/no</b><small>For decession making purpose</small></td></tr><tr><td><b>show list:</b> <small>prints list</small></td></tr><tr><td><b>Confirm list:</b> <small>will send it to a staff member for billing</small></td></tr><tr><td><b>What is the amount:</b> <small>Displays amount</small></td></tr><tr><td><b>Offers in *item:</b><small>Shows you offers on the item if there are any</small></td></tr><tr><td><b>Delete list:</b> <small>deletes shopping list</small></td></tr></table>");},1000);		
		artyom.say("Here is what all I can do");
	}
	
	function checkingMessage(){
		console.log("checking messages");
		<%
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/shoppingmall","root","root");
			Statement st = conn.createStatement();
			String q = "SELECT message FROM orders WHERE id = "+token;
			ResultSet rs = st.executeQuery(q);
			while(rs.next()){
				String message = rs.getString("message");
				%>
				console.log("inside message checking");
				var message = <%=message%>
				if(message != null){
					artyom.say(message);
				}
		<%
			}
		%>
	}
	
	//window.setInterval(checkingMessage,500);
	
	</script>
	<script src="js/commands.js"></script>
	<script src="js/write.js"></script>
	<script src="js/bag.js"></script>
</html>