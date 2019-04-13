<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/loginstyle.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<title>TRIP-TWELVE</title>
</head>
<body>

	<div class="container-fluid principal">

		<nav
			class="navbar navbar-expand-md navbar-light fixed-top custom-navbar">
			<!-- 		1navbar-light bg-light     2navbar navbar-brand navbar-expand-lg navbar-light fixed-top scrolling-navbar-->
			<div class="container-fluid">
				<a class="navbar-brand mb-0 h1" href="#""><img
					src="img/travel.png" style="width: 40px; margin-right: 5px;">
					TripTwelve</a>
			</div>
		</nav>

		<shiro:guest>
			<div class="row justify-content-center align-items-center"
				id="loginForm" style="height: 100vh">
				<form class="p-3 mb-2 form-custom text-dark rounded-lg border "
					action="LoginServlet" method="post">
					<div class="form-group">
						<label for="loginEmail">Email: </label> <input type="text"
							name="email" class="form-control" placeholder="Email"
							id="loginEmail" />
					</div>
					<div class="form-group">
						<label for="loginPassword">Password:</label> <input
							type="password" name="password" class="form-control"
							placeholder="Password" id="loginPassword" />
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-outline-dark">Login</button>
					</div>
				</form>
			</div>
		</shiro:guest>
	</div>

	<shiro:user>
    Welcome back <shiro:principal />! Click <a href="LogoutServlet">here</a> to logout.
</shiro:user>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>