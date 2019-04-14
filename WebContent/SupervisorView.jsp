 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/employeestyle.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css">

<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />

<title>Supervisor</title>
</head>
<body id="page-top">

<nav class="navbar navbar-expand-md navbar-light bg-light fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand mb-0 h1" href="#"><img src="img/travel.png" style="width: 40px; margin-right: 5px;">TripTwelve</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link" href="#new-trip">New Trip</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#trips">Trips</a>
					</li>
					<li class="nav-item">
						<shiro:user>
							<a class="nav-link" href="LogoutServlet">Logout</a>
						</shiro:user>
					</li>
				</ul>
			</div>
		</div>
	</nav>

<hr>
	<h2>Vista de supervisor</h2>
	<shiro:lacksRole name="supervisor">
	No tienes permiso para ver el contenido de esta página
</shiro:lacksRole>
	<shiro:hasRole name="supervisor">
			
		<h3>Listado de Viajes</h3>
 		<table border="1">
			<tr> 
				<th>Destino</th>
				<th>Fecha de Ida</th>
 				<th>Fecha de Vuelta</th> 
				<th>Motivo del viaje</th> 
				<th>Importe Esperado</th> 
 				<th>Acción requerida</th> 
 			</tr>
 			<c:forEach items="${trip_list}" var="tripi"> 
 				<tr> 
					<td>${tripi.destiny }</td> 
 					<td>${tripi.startDate }</td> 
 					<td>${tripi.endDate }</td> 
 					<td>${tripi.motive }</td>
					<td>${tripi.amount }</td> 
<!--  					Falta añadir la acción requerida -->
 					<td><c:if test="${tripi.state == 0}"> 
 							<form action="ForwardStatusServlet" method="post">
 								<input type="hidden" name="tripId" value="${tripi.tripId}" />
 								<input type="hidden" name="isSupervisor" value="${true}" />
								<button type="submit">Aceptar Viaje</button>
							</form> 
 						</c:if>
						<c:if test="${tripi.state == 2}"> 
							<form action="ForwardStatusServlet" method="post">
 								<input type="hidden" name="tripId" value="${tripi.tripId}" /> 
 								<input type="hidden" name="isSupervisor" value="${true}" />
								<button type="submit">Aceptar Reintegro</button> 
 							</form> 
 						</c:if>
					</td> 
 				</tr> 
 			</c:forEach> 
 		</table>	
 			 
	</shiro:hasRole>

</body>
</html>