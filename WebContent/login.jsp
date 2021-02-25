<%@ page import="java.sql.*"%>

<!-- HERE SESSION CONTROL IF USER NOT LOGIN THEN RETURN HOME PAGE IF LOGIN THEN RETURN PRODUCTS -->
<%-- <%
if (session.getAttribute("login") == null) {
	response.sendRedirect("products.jsp");
}
%>
 --%>
<%

/* This is the second version of the database connection, we can use both types. */
try {
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "159753sas");

	if (request.getParameter("btn_login") != null) {
		String dbName, dbPassword;

		String username, password;

		username = request.getParameter("username");
		password = request.getParameter("password");

		PreparedStatement ps = null;

		ps = con.prepareStatement("select * from webdb.member where username=? AND password=?");
		ps.setString(1, username);
		ps.setString(2, password);

		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			dbName = rs.getString("username");
			dbPassword = rs.getString("password");
	
		if (username.equals(dbName) && password.equals(dbPassword)) {
			session.setAttribute("login", dbName);
			response.sendRedirect("products.jsp");
		}
			} else {
		request.setAttribute("errorMsg", "invalid email or password");
			}
	
			con.close();
		}

} catch (Exception e) {
	out.println(e);
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Login Page</title>
<style>
* {
	padding: 0;
	margin: 0;
	font-family: 'Raleway', sans-serif;
}

.center {
	text-align: center;
	margin-top: 150px;
}

.form-element {
	margin: 20px auto;
}
</style>
</head>
<body>

	<div class="center">
		<form class="form-register" method="post" name="myform"
			onsubmit="return validate();">
			<div class="form-register-with-email">
				<div class="form-white-background">
					<h1>Welcome To Gorkem's Page</h1>
					<p style="color: red">
						<%
						if (request.getAttribute("errorMsg") != null) {
							out.println(request.getAttribute("errorMsg")); //error message for email or password 
						}
						%>
					</p>
					</br>
					<div class="form-row">
						<label> <span>Username: <br></span> <input
							type="text" name="username" id="username"
							placeholder="enter username">
						</label>
					</div>
					<br>
					<div class="form-row">
						<label> <span>Password: <br></span><input
							type="password" name="password" id="password"
							placeholder="enter password">
						</label>
					</div>
					<br> <input type="submit" name="btn_login" value="Login">
				</div>
				<br> <br> <a href="register.jsp"
					class="form-log-in-with-existing"> <b>Register here if you
						don't have an account</b>
				</a>
			</div>
		</form>
	</div>
</body>
</html>