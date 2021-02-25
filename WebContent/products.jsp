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
<title>Products Page</title>
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
	/* 	background-color: silver; */
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
	padding: 50px;
	float: left;
	width: 180px;
}

div.gallery:hover {
	border: 1px solid #777;
}

div.gallery img {
	width: 100%;
	height: auto;
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
				<li><a href="#">Home</a></li>
				<li><a href="cart.jsp">Shopping Card</a></li>
				<li><a href="logout.jsp">Logout</a></li>
			</ul>
		</div>
	</div>
	<br>

	<%
	try {
		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		statement = connection.createStatement();
		String sql = "select * from webdb.products where id = 1";
		resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
	%>

	<div class=gallery>
		<img src=<%=resultSet.getString("image")%> width="200" height="200"
			class="imgText">
		<h3 style="text-align: center; font-weight: 500;"></h3>
		<div style="width: 300px; margin: 0 auto">
			<p>
				Model:
				<%=resultSet.getString("model")%>
			</p>
			<p>
				Type:
				<%=resultSet.getString("type")%>
			</p>
			<p>
				Torque:
				<%=resultSet.getString("torque")%></p>
			<p>
				CC:
				<%=resultSet.getString("cc")%></p>
			<p>
				Price:
				<%=resultSet.getString("price")%> TL</p>
			<p>
				Description:
				<%=resultSet.getString("desc")%></p>
			<p>
				Count:
				<%=resultSet.getString("count")%></p>
			<p></p>
			<p class="clearfix"></p>
		</div>
		<div class="button" type="button">
			<a href="products_detail.jsp?id=<%=resultSet.getString("id")%>">
				Show Product </a>
		</div>
	</div>

	<%
	}
	connection.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>

	<%
	try {
		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		statement = connection.createStatement();
		String sql = "select * from webdb.products where id = 2";
		resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
	%>

	<div class="gallery">
		<img src=<%=resultSet.getString("image")%> width="200" height="200"
			class="imgText">
		<h3 style="text-align: center; font-weight: 500;"></h3>
		<div style="width: 300px; margin: 0 auto">
			<p>
				Model:
				<%=resultSet.getString("model")%>
			</p>
			<p>
				Type:
				<%=resultSet.getString("type")%>
			</p>
			<p>
				Torque:
				<%=resultSet.getString("torque")%></p>
			<p>
				CC:
				<%=resultSet.getString("cc")%></p>
			<p>
				Price:
				<%=resultSet.getString("price")%> TL</p>
			<p>
				Description:
				<%=resultSet.getString("desc")%></p>
			<p>
				Count:
				<%=resultSet.getString("count")%></p>
			<p></p>
			<p class="clearfix"></p>
		</div>
		<div class="button">
			<a href="products_detail.jsp?id=<%=resultSet.getString("id")%>">
				Show Product </a>
		</div>
	</div>
	<%
	}
	connection.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>

	<%
	try {
		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		statement = connection.createStatement();
		String sql = "select * from webdb.products where id = 3";
		resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
	%>

	<div class="gallery">
		<img src=<%=resultSet.getString("image")%> width="200" height="200"
			class="imgText">
		<h3 style="text-align: center; font-weight: 500;"></h3>
		<div style="width: 300px; margin: 0 auto">
			<p>
				Model:
				<%=resultSet.getString("model")%>
			</p>
			<p>
				Type:
				<%=resultSet.getString("type")%>
			</p>
			<p>
				Torque:
				<%=resultSet.getString("torque")%></p>
			<p>
				CC:
				<%=resultSet.getString("cc")%></p>
			<p>
				Price:
				<%=resultSet.getString("price")%> TL</p>
			<p>
				Description:
				<%=resultSet.getString("desc")%></p>
			<p>
				Count:
				<%=resultSet.getString("count")%></p>
			<p></p>
			<p class="clearfix"></p>
		</div>
		<div class="button">
			<a href="products_detail.jsp?id=<%=resultSet.getString("id")%>">
				Show Product </a>
		</div>
	</div>
	<%
	}
	connection.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>

	<%
	try {
		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		statement = connection.createStatement();
		String sql = "select * from webdb.products where id = 4";
		resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
	%>

	<div class="gallery">
		<img src=<%=resultSet.getString("image")%> width="200" height="200"
			class="imgText">
		<h3 style="text-align: center; font-weight: 500;"></h3>
		<div style="width: 300px; margin: 0 auto">
			<p>
				Model:
				<%=resultSet.getString("model")%>
			</p>
			<p>
				Type:
				<%=resultSet.getString("type")%>
			</p>
			<p>
				Torque:
				<%=resultSet.getString("torque")%></p>
			<p>
				CC:
				<%=resultSet.getString("cc")%></p>
			<p>
				Price:
				<%=resultSet.getString("price")%> TL</p>
			<p>
				Description:
				<%=resultSet.getString("desc")%></p>
			<p>
				Count:
				<%=resultSet.getString("count")%></p>
			<p></p>
			<p class="clearfix"></p>
		</div>
		<div class="button">
			<a href="products_detail.jsp?id=<%=resultSet.getString("id")%>">
				Show Product </a>
		</div>
	</div>
	<%
	}
	connection.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	<%-- 
	<img src="data:image/jpg;base64,${product.get('base64Image')}"
		width="240" height="300" />
	<h2>
		<c:out value="${product.get('type')} asd" />
	</h2>

	<div class="desc">
		<h2 class="center">
			<c:out value="${product.get('model')}"></c:out>
		</h2>
	</div>
	<div class="desc">
		<h2 class="center">
			<c:out value="${product.get('desc')}"></c:out>
		</h2>
	</div>
	<div class="price">
		<h2 class="center">
			<c:out value="${product.get('price')}"></c:out>
			TL
		</h2>
	</div>
	<div class="quantity">
		<h2 class="center">
			<c:out value="${product.get('count')} Count"></c:out>
		</h2>
	</div> --%>

</body>
</html>