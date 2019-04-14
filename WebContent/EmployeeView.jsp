
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
<!-- Bootstrap Date-Picker Plugin -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>


<title>Employee</title>
</head>
<body id="page-top">

<shiro:hasRole name="employee">
<div class="container-fluid principal">
<!-- 	Navigation -->
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
	

<!-- 	Welcome / New Trip Button Section-->
	<div id="new-trip" class="container-fluid">
		<div class="row justify-content-center align-items-center" id="loginForm" style="height: 100vh; ">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-warning btn-circle btn-xl" data-toggle="modal" data-target="#exampleModal">
				  New Trip
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">New Trip
									Request</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="CreateTripServlet" method="post">
									<div class="form-group">
										<label for="destination"> Destino: </label> <input type="text" name="destination" id="destination" class="form-control" placeholder="Ciudad"/>                
									</div>
									<div class="form-group ">
										<label class="control-label " for="startDate"> Fecha de ida: </label> 
										<div class="input-group">
										<input class="form-control" id="startDate"
											name="startDate" placeholder="MM/DD/YYYY" type="text" />
											<div class="input-group-append">
												<div class="input-group-text">
													<i class="fa fa-calendar"> </i>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group ">
										<label class="control-label " for="endDate"> Fecha de vuelta: </label> 
										<div class="input-group">
											<input class="form-control" id="endDate"  name="endDate" placeholder="MM/DD/YYYY" type="text" />
											<div class="input-group-append">
												<div class="input-group-text">
													<i class="fa fa-calendar"> </i>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="motive"> Motivo del viaje: </label> <textarea type="text" name="motive" id="motive" class="form-control" placeholder="Introduzca motivo" rows="3"> </textarea>               
									</div>
									<div class="form-group">
										<label for="amount"> Importe esperado: </label>
										<div class="input-group">
											<input type="text" name="amount" id="amount" class="form-control" placeholder="Importe" />
											<div class="input-group-append">
												<span class="input-group-text">€</span>
											</div>
										</div>
									</div>
									<span class="glyphicon glyphicon-calendar"></span>
									<input type="hidden" name="email" value="${employee.email}" />
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-warning">Save
											changes</button>
									</div>
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
					
	</div>
	
	
</div>
<!-- 	All Trips Table Section-->	
<div id="trips" class="container-fluid">
	<div class="row justify-content-center align-items-center" id="loginForm" style="height: 100vh">
		<button class="btn btn-outline-dark">boton</button>

	</div>
</div>
<div id="trips" class="container-fluid">
	<div class="row justify-content-center align-items-center" id="loginForm" style="height: 100vh">
		<table class="table ">
		  	<thead class="thead-light">
			   	 <tr>
			   	   <th scope="col">#</th>
			   	   <th scope="col">Destino</th>
			   	   <th scope="col">Fecha de ida</th>
			   	   <th scope="col">Fecha de vuelta</th>
			   	   <th scope="col">Importe</th>
			   	 </tr>
		  	</thead>
		  	
<c:forEach items="${trip_list}" var="tripi" varStatus="loop">		  	
		  	
		  	
		  	<tbody  id="accordion">
				<tr class="accordion-toggle">
				<td data-toggle="collapse" data-target="#collapseTwo" scope="row">${loop.index +1}</td>
				<td data-toggle="collapse" data-target="#collapseTwo">${tripi.destiny }</td>
				<td data-toggle="collapse" data-target="#collapseTwo">${tripi.startDate }</td>
				<td data-toggle="collapse" data-target="#collapseTwo">${tripi.endDate }</td>
				<td data-toggle="collapse" data-target="#collapseTwo">${tripi.amount } €</td>
				<td><i class="icon-search icon-white"></i></td>
				</tr>
			
				<tr>
					<td></td>
					<td colspan="4">
						<div id="collapseTwo" class="collapse in" data-parent="#accordion">
							${tripi.motive}
						</div>
					</td>
				</tr>
			</tbody>
			
</c:forEach>
			
		</table>
	</div>
</div>


<!-- <div id="trips" class="container-fluid"> -->
<!-- 	<div class="row justify-content-center align-items-center" id="loginForm" style="height: 100vh"> -->
	
<!-- 						<table border="1"> -->
<!-- 					<tr> -->
<!-- 						<th>Destino</th> -->
<!-- 						<th>Fecha de Ida</th> -->
<!-- 						<th>Fecha de Vuelta</th> -->
<!-- 						<th>Motivo del viaje</th> -->
<!-- 						<th>Importe Esperado</th> -->
<!-- 						<th>Acción requerida</th> -->
<!-- 						<th>Detalles del viaje</th> -->
<!-- 					</tr> -->
<%-- 					<c:forEach items="${trip_list}" var="tripi"> --%>
<!-- 						<tr> -->
<%-- 							<td>${tripi.destiny }</td> --%>
<%-- 							<td>${tripi.startDate }</td> --%>
<%-- 							<td>${tripi.endDate }</td> --%>
<%-- 							<td>${tripi.motive }</td> --%>
<%-- 							<td>${tripi.amount }</td> --%>
<%-- 							<td><c:if test="${tripi.state == 1}"> --%>
<!-- 									<form action="ForwardStatusServlet" method="post"> -->
<%-- 										<input type="hidden" name="tripId" value="${tripi.tripId}" /> --%>
<%-- 										<input type="hidden" name="isSupervisor" value="${false}" /> --%>
<!-- 										<button type="submit">Solicitar reintegro</button> -->
<!-- 									</form> -->
<%-- 								</c:if> <c:if test="${tripi.state == 0}">  --%>
<!-- 	 							Pendiente de aceptacion -->
<%-- 	 						</c:if></td> --%>
<%-- 							<c:if test="${tripi.state == 1}"> --%>
<!-- 								<td> -->
<!-- 									<form action="TripServlet"> -->
<%-- 										<input type="hidden" name="tripId" value="${tripi.tripId}" /> --%>
<!-- 										<button type="submit">Ver detalles</button> -->
<!-- 									</form> -->
<!-- 								</td> -->
<%-- 							</c:if> --%>
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
<!-- 				</table> -->
<!-- 	</div> -->
<!-- </div> -->
</shiro:hasRole>



<!-- 		<div class="container-fluid"> -->
<!-- 			<hr> -->

<!-- 			<h2>Vista de empleado</h2> -->


<%-- 			<shiro:lacksRole name="employee"> --%>
<!-- 				No tienes permiso para ver el contenido de esta página -->
<%-- 			</shiro:lacksRole> --%>


<%-- 			<shiro:hasRole name="employee"> --%>

<!-- 				<h3>Crear Viaje nuevo</h3> -->

<!-- 				<form action="CreateTripServlet" method="post"> -->
<!-- 					<p> -->
<!-- 						Destino: <input type="text" name="destination" /> -->
<!-- 					</p> -->
<!-- 					<p> -->
<!-- 						Fecha de Ida: <input type="text" name="startDate" /> -->
<!-- 					</p> -->
<!-- 					<p> -->
<!-- 						Fecha de Vuelta: <input type=text name="endDate" /> -->
<!-- 					</p> -->
<!-- 					<p> -->
<!-- 						Motivo del viaje: <input type="text" name="motive" /> -->
<!-- 					</p> -->
<!-- 					<p> -->
<!-- 						Importe Esperado: <input type="text" name="amount" /> -->
<!-- 					</p> -->
<%-- 					<input type="hidden" name="email" value="${employee.email}" /> --%>
<!-- 					<p> -->
<!-- 						<button type="submit">Crear Viaje</button> -->
<!-- 					</p> -->
<!-- 				</form> -->

<!-- 				<h3>Listado de Viajes</h3> -->
<!-- 				<table border="1"> -->
<!-- 					<tr> -->
<!-- 						<th>Destino</th> -->
<!-- 						<th>Fecha de Ida</th> -->
<!-- 						<th>Fecha de Vuelta</th> -->
<!-- 						<th>Motivo del viaje</th> -->
<!-- 						<th>Importe Esperado</th> -->
<!-- 						<th>Acción requerida</th> -->
<!-- 						<th>Detalles del viaje</th> -->
<!-- 					</tr> -->
<%-- 					<c:forEach items="${trip_list}" var="tripi"> --%>
<!-- 						<tr> -->
<%-- 							<td>${tripi.destiny }</td> --%>
<%-- 							<td>${tripi.startDate }</td> --%>
<%-- 							<td>${tripi.endDate }</td> --%>
<%-- 							<td>${tripi.motive }</td> --%>
<%-- 							<td>${tripi.amount }</td> --%>
<%-- 							<td><c:if test="${tripi.state == 1}"> --%>
<!-- 									<form action="ForwardStatusServlet" method="post"> -->
<%-- 										<input type="hidden" name="tripId" value="${tripi.tripId}" /> --%>
<%-- 										<input type="hidden" name="isSupervisor" value="${false}" /> --%>
<!-- 										<button type="submit">Solicitar reintegro</button> -->
<!-- 									</form> -->
<%-- 								</c:if> <c:if test="${tripi.state == 0}">  --%>
<!-- 	 							Pendiente de aceptacion -->
<%-- 	 						</c:if></td> --%>
<%-- 							<c:if test="${tripi.state == 1}"> --%>
<!-- 								<td> -->
<!-- 									<form action="TripServlet"> -->
<%-- 										<input type="hidden" name="tripId" value="${tripi.tripId}" /> --%>
<!-- 										<button type="submit">Ver detalles</button> -->
<!-- 									</form> -->
<!-- 								</td> -->
<%-- 							</c:if> --%>
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
<!-- 				</table> -->
<%-- 			</shiro:hasRole> --%>
<!-- 		</div> -->
<!-- 	</div> -->
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<!-- Bootstrap Date-Picker Plugin -->
	<!-- Include Date Range Picker -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
	<script>
	    $(document).ready(function(){
	        var date_input=$('input[name="startDate"]');//our date input has the name "startDate"
	        var date_input2=$('input[name="endDate"]');//our date input has the name "endDate"
	        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
	        date_input.datepicker({
	            format: 'mm/dd/yyyy',
	            container: container,
	            todayHighlight: true,
	            autoclose: true,
	        })
	        date_input2.datepicker({
	            format: 'mm/dd/yyyy',
	            container: container,
	            todayHighlight: true,
	            autoclose: true,
	        })
	    })
	</script>
		
	
</body>
</html>