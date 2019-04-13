
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/loginstyle.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<title>Employee View</title>
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
		<shiro:user>
    Welcome back <shiro:principal />! Click <a href="LogoutServlet">here</a> to logout.
</shiro:user>
		<hr>
		<h2>Vista de empleado</h2>
		<shiro:lacksRole name="employee">
	No tienes permiso para ver el contenido de esta página
</shiro:lacksRole>



		<shiro:hasRole name="employee">
			<h3>Crear Viaje nuevo</h3>
			<form action="CreateTripServlet" method="post">
				<p>
					Destino: <input type="text" name="destination" />
				</p>
				<p>
					Fecha de Ida: <input type="text" name="startDate" />
				</p>
				<p>
					Fecha de Vuelta: <input type=text name="endDate" />
				</p>
				<p>
					Motivo del viaje: <input type="text" name="motive" />
				</p>
				<p>
					Importe Esperado: <input type="text" name="amount" />
				</p>
				<input type="hidden" name="email" value="${employee.email}" />
				<p>
					<button type="submit">Crear Viaje</button>
				</p>
			</form>

			<h3>Listado de Viajes</h3>
			<table border="1">
				<tr>
					<th>Destino</th>
					<th>Fecha de Ida</th>
					<th>Fecha de Vuelta</th>
					<th>Motivo del viaje</th>
					<th>Importe Esperado</th>
					<th>Acción requerida</th>
					<th>Detalles del viaje</th>
				</tr>
				<c:forEach items="${trip_list}" var="tripi">
					<tr>
						<td>${tripi.destiny }</td>
						<td>${tripi.startDate }</td>
						<td>${tripi.endDate }</td>
						<td>${tripi.motive }</td>
						<td>${tripi.amount }</td>
						<td><c:if test="${tripi.state == 1}">
								<form action="ForwardStatusServlet" method="post">
									<input type="hidden" name="tripId" value="${tripi.tripId}" />
									<input type="hidden" name="isSupervisor" value="${false}" />
									<button type="submit">Solicitar reintegro</button>
								</form>
							</c:if> <c:if test="${tripi.state == 0}"> 
 							Pendiente de aceptacion
 						</c:if></td>
						<c:if test="${tripi.state == 1}">
							<td>
								<form action="TripServlet" method="post">
									<input type="hidden" name="tripId" value="${tripi.tripId}" />
									<button type="submit">Ver detalles</button>
								</form>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</shiro:hasRole>


		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
			integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			crossorigin="anonymous"></script>
	</div>
</body>
</html>