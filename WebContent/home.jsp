<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
<style>

	.header{
		margin-left: -10px;
		margin-right: -10px;
		margin-top: -10px;
	}

	.title{
		text-align: center;
		font-size: 50px;
		background-color: teal;
		color:white;
		padding: 10px;
	}
	ul{
		list-style-type: none;
		margin: 0px;
		padding: 0px;
		overflow: hidden;
	}
	
	li{
		float: left;
	}
	
	li a {
		display: block;
		padding: 14px 18px;
		color: black;
		text-decoration: none;
	}
	
	li a:hover {
		background-color: silver;
	}
	
	
</style>
</head>
<body>
	<div class = "header">
    <div class = "title" >Welcome to Gorkem Toprak's E-Commerce Page</div>
    <div class = "menu">
    	<ul>
    		<li><a href = "#">Home</a></li>
    		<li><a href = "register.jsp">Register</a></li>
    		<li><a href = "login.jsp">Login</a></li>
    	</ul>
    </div>
    </div>
    <p>Not Logged In... Please click register button.   
</body>
</html>