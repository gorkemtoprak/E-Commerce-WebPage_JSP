<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "webdb";
String userid = "root";
String password = "159753sas";
try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Card Page</title>
<style>
.header {
	margin-left: -10px;
	margin-right: -10px;
	margin-top: -10px;
}

.title {
	text-align: center;
	font-size: 50px;
	background-color: teal;
	color: white;
	padding: 10px;
}

ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
}

li {
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

.price {
	background-color: white;
	position: relative;
	width: 40%;
	height: 20%;
	left: 30%;
	margin-top: 10%;
	border: none;
}

.desc {
	background-color: white;
	position: relative;
	width: 80%;
	height: 30%;
	left: 10%;
	margin-top: 10%;
	border: none;
}

#margin {
	margin: 2% 8% 2% 4%;
}

#margin3 {
	margin: 2% 0% 2% 2%;
}

div.gallery {
	padding-left: 300px;
	padding-top: 10px;
	float: left;
	width: 200px;
	align-content: center;
}
</style>
</head>
<body>

	<div class="header">
		<div class="title">
			<%
			String name = (String) session.getAttribute("login"); //Getting Session Attribute
			out.print(name + ", Welcome to My E-Commerce Page");
			%>
		</div>
		<div class="menu">
			<ul>
				<li><a href="products.jsp">Show Products</a></li>
				<li><a href="home.jsp">Logout</a></li>
			</ul>
		</div>
	</div>
	<br>

	<%
	try {
		int id = Integer.parseInt(request.getParameter("id"));
		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		statement = connection.createStatement();
		String sql = "select * from webdb.products_detail where id='" + id + "'";
		resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
	%>

	<div class=gallery>
		<img src=<%=resultSet.getString("image")%> width="200" height="200"
			class="imgText">
		<h3 style="text-align: center; font-weight: 500;"></h3>
		<div style="">
			<p style="text-align: center;">
				Model:
				<%=resultSet.getString("model")%>
			</p>
			<p style="text-align: center;">
				Description:
				<%=resultSet.getString("desc")%></p>
			<p style="text-align: center;">
				Price:
				<%=resultSet.getString("price")%>
				TL
			</p>
			<p class="clearfix"></p>
		</div>
		<a href="cart.jsp"
			style="text-align: center; padding-left: 65px; padding-bottom: 50px;">Buy
			items</a>
	</div>
	</div>

	<%
	}
	connection.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>