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

	<shiro:lacksRole name="supervisor">
	No tienes permiso para ver el contenido de esta página
</shiro:lacksRole>
	<shiro:hasRole name="supervisor">
			
			
<div id="trips" class="container-fluid">
<div class="row justify-content-center align-items-center" id="loginForm" style="height: 100vh">

	<table class="table">
	<thead class="thead-light">
	   	 <tr>
	   	   <th scope="col">#</th>
	   	   <th scope="col">Destino</th>
	   	   <th scope="col">Fecha de ida</th>
	   	   <th scope="col">Fecha de vuelta</th>
	   	   <th scope="col">Importe</th>
	   	   <th>Acción requerida</th>
	   	   <th>Detalles del viaje</th>
	   	 </tr>
  	</thead>
		<c:forEach items="${trip_list}" var="tripi" varStatus="loop"> 
			<tbody  id="accordion">
				<tr class="accordion-toggle">
				<td data-toggle="collapse" data-target="#collapseTwo${tripi.tripId}" scope="row">${loop.index +1}</td>
				<td data-toggle="collapse" data-target="#collapseTwo${tripi.tripId}">${tripi.destiny }</td>
				<td data-toggle="collapse" data-target="#collapseTwo${tripi.tripId}">${tripi.startDate }</td>
				<td data-toggle="collapse" data-target="#collapseTwo${tripi.tripId}">${tripi.endDate }</td>
				<td data-toggle="collapse" data-target="#collapseTwo${tripi.tripId}">${tripi.amount } €</td>
				<td data-toggle="collapse" data-target="#collapseTwo${tripi.tripId}">
				<c:if test="${tripi.state == 0}"> 
						<form action="ForwardStatusServlet" method="post">
							<input type="hidden" name="tripId" value="${tripi.tripId}" />
							<input type="hidden" name="isSupervisor" value="${true}" />
						<button type="submit" class="btn btn-outline-dark">Aceptar Viaje</button>
					</form> 
					</c:if>
					<c:if test="${tripi.state == 0}"> 
						<form action="PreviousStatusServlet" method="post">
							<input type="hidden" name="tripId" value="${tripi.tripId}" />
							<input type="hidden" name="isSupervisor" value="${true}" />
						<button type="submit" class="btn btn-outline-dark">Denegar Viaje</button>
					</form> 
					</c:if>
				<c:if test="${tripi.state == 2}"> 
					<form action="ForwardStatusServlet" method="post">
							<input type="hidden" name="tripId" value="${tripi.tripId}" /> 
							<input type="hidden" name="isSupervisor" value="${true}" />
						<button type="submit" class="btn btn-outline-dark">Aceptar Reintegro</button> 
						</form> 
				</c:if>
				</td>
				<td data-toggle="collapse" data-target="#collapseTwo${tripi.tripId}">
									<form action="TripServlet">
										<input type="hidden" name="tripId" value="${tripi.tripId}" />
										<input type="hidden" name="email" value="${supervisor.email}" />
										<button class="btn btn-outline-dark" type="submit">Ver detalles</button>
									</form>
				</td>
				<td><i class="icon-search icon-white"></i></td>
			</tr> 
				<tr>
					<td style="margin:0; padding:0; border-spacing: 0;"></td>
					<td colspan="6" style="margin:0; padding:0; border-spacing: 0;">
						<div id="collapseTwo${tripi.tripId}" class="collapse in" data-parent="#accordion">
							<div style="margin:5px; padding:5px;">
								<div>Descripción: </div>${tripi.motive}
							</div>
						</div>
					</td>
				</tr>
				</tbody>
		</c:forEach> 
	</table>	
 		
 		
</div>	
</div>			 
</shiro:hasRole>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>