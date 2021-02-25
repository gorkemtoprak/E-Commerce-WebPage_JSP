<%@ page import="java.sql.*"%>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "159753sas");

	if (request.getParameter("btn_register") != null) {
		String username, password;

		username = request.getParameter("username");
		password = request.getParameter("password");

		PreparedStatement ps = null;

		ps = con.prepareStatement("INSERT INTO webdb.member(username,password) values(?,?)");
		ps.setString(1, username);
		ps.setString(2, password);
		ps.executeUpdate(); 
		request.setAttribute("successMsg", "Register Successfull");
		request.getRequestDispatcher("/login.jsp");
		response.sendRedirect("login.jsp");
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

<title>Register Page</title>
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

		<form class="form-register" method="post"
			onsubmit="return validate();">
			<div class="form-register-with-email">
				<div class="form-white-background">

					<h1>Welcome To Gorkem's Page</h1>
					<h3>Before Enter Please Register</h3>

					<p style="color: blue">
						<%
						if (request.getAttribute("successMsg") != null) {
							out.println(request.getAttribute("successMsg")); //register success message
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
						<label> <span>Password: <br></span> <input
							type="password" name="password" id="password"
							placeholder="enter password">
						</label>
					</div>
					<br> <input type="submit" name="btn_register" value="Register">
				</div>
				<br> <br>
				<a href="login.jsp" class="form-log-in-with-existing"><b>
						Login here if already have an account</b> </a>
			</div>
		</form>
	</div>
</body>
</html>
