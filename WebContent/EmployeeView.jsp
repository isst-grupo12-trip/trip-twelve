
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="CSS/checkbox.css">
<link rel="stylesheet" href="CSS/employeestyle.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css">

<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
<!-- Bootstrap Date-Picker Plugin -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>


<title>Employee</title>
</head>


<body id="page-top">


<shiro:lacksRole name="admin">
	No tienes permiso para ver el contenido de esta página <a class="nav-link" href="LogoutServlet">Iniciar sesión</a>
</shiro:lacksRole>


<shiro:hasRole name="employee">
<div class="container-fluid principal space-between">
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
						<a class="nav-link" href="#new-trip">Nuevo Viaje</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#trips">Viajes</a>
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
			  Nuevo Viaje
			</button>
			
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Nueva Solicitud de Viaje</h5>
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
								<!-- Checkbox for deposit -->
								<div class="form-group">									
									<label for="checkbox" class="container"> 
										<b class="emphasize">Reembolso previo:</b>
										<input type="checkbox" name="checkbox" id="checkbox" class="checkbox" onclick="show()">
										<span class="checkmark"></span>
									</label>
									<div class="input-group">
										<input type="text" name="deposit" id="deposit" class="form-control"
										readonly onmousedown="return false;" /> <!-- Impide selección/modificación -->
										<div class="input-group-append">
											<span class="input-group-text">€</span>
										</div>
									</div>   
								</div>
								
								<span class="glyphicon glyphicon-calendar"></span>
								<input type="hidden" name="email" value="${employee.email}" />
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Cerrar</button> 
										<button type="submit" class="btn btn-warning">Guardar Cambios</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
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
					<td data-toggle="collapse" data-target="#collapseTwo${tripi.tripId}">
					<c:if test="${tripi.startDate.getDate() < 10}">0</c:if>${tripi.startDate.getDate()}/<c:if test="${tripi.startDate.getMonth()+1 < 10}">0</c:if>${tripi.startDate.getMonth()+1}/${tripi.startDate.getYear()+1900}
					</td>
					<td data-toggle="collapse" data-target="#collapseTwo${tripi.tripId}">
					<c:if test="${tripi.endDate.getDate() < 10}">0</c:if>${tripi.endDate.getDate()}/<c:if test="${tripi.endDate.getMonth()+1 < 10}">0</c:if>${tripi.endDate.getMonth()+1}/${tripi.endDate.getYear()+1900}
					</td>
					<td data-toggle="collapse" data-target="#collapseTwo${tripi.tripId}">${tripi.amount } €</td>
					<c:if test="${tripi.state == 0}"> 
						<td data-toggle="collapse" data-target="#collapseTwo${tripi.tripId}">Pendiente de aceptacion</td>
						<td>
							<form action="TripServlet">
								<input type="hidden" name="tripId" value="${tripi.tripId}" />
								<input type="hidden" name="email" value="${employee.email}" />
								<button type="submit" class="btn btn-outline-dark">Ver detalles</button>
							</form>
						</td>
					</c:if>
					<c:if test="${tripi.state == 1}">
						<td data-toggle="collapse" data-target="#collapseTwo${tripi.tripId}">
							<form action="ForwardStatusServlet" method="post">
								<input type="hidden" name="tripId" value="${tripi.tripId}" />
								<input type="hidden" name="isSupervisor" value="${false}" />
								<input type="hidden" name="email" value="${employee.email}" />
								<button class="btn btn-outline-dark" type="submit">Solicitar reintegro</button>
							</form>
						</td>
						<td>
							<form action="TripServlet">
								<input type="hidden" name="tripId" value="${tripi.tripId}" />
								<input type="hidden" name="email" value="${employee.email}" />
								<button class="btn btn-outline-dark" type="submit">Ver detalles</button>
							</form>
						</td>
					</c:if>
					<c:if test="${tripi.state == 2}"> 
							<td data-toggle="collapse" data-target="#collapseTwo${tripi.tripId}">Pendiente de reintegro</td>
							<td>
							<form action="TripServlet">
								<input type="hidden" name="tripId" value="${tripi.tripId}" />
								<input type="hidden" name="email" value="${employee.email}" />
								<button class="btn btn-outline-dark" type="submit">Ver detalles</button>
							</form>
						</td>
					</c:if>
					<c:if test="${tripi.state == 3}">
						<td data-toggle="collapse" data-target="#collapseTwo${tripi.tripId}">Finalizado</td>
						<td>
							<form action="TripServlet">
								<input type="hidden" name="tripId" value="${tripi.tripId}" />
								<input type="hidden" name="email" value="${employee.email}" />
								<button class="btn btn-outline-dark" type="submit">Ver detalles</button>
							</form>
						</td>
					</c:if>
					<c:if test="${tripi.state == -1}">						
						<td>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#exampleModalEdit${tripi.tripId}">Editar petición</button>
						
						<!-- Modal -->
						<div class="modal fade" id="exampleModalEdit${tripi.tripId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header bg-dark text-white">
										<h5 class="modal-title" id="exampleModalLabel">Editar Solicitud de Viaje</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form action="EditTripServlet" method="post">
										<input type="hidden" name="tripId" value="${tripi.tripId}" />
										<input type="hidden" name="email" value="${employee.email}" />
											<div class="form-group">
									<label for="destination"> Destino: </label> <input type="text" name="destination" id="destination" class="form-control" value="${tripi.destiny}"/>                
								</div>
								<div class="form-group ">
									<label class="control-label " for="startDate"> Fecha de ida: </label> 
									<div class="input-group">
									<input class="form-control" id="startDate"
										name="startDate" value="${tripi.startDate.getDate()}/${tripi.startDate.getMonth()+1}/${tripi.startDate.getYear()+1900}" type="text" />
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
										<input class="form-control" id="endDate"  name="endDate" value="${tripi.endDate.getDate()}/${tripi.endDate.getMonth()+1}/${tripi.endDate.getYear()+1900}" type="text" />
										<div class="input-group-append">
											<div class="input-group-text">
												<i class="fa fa-calendar"> </i>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="motive"> Motivo del viaje: </label> <textarea name="motive" id="motive" class="form-control" rows="3">${tripi.motive}</textarea>               
								</div>
								<div class="form-group">
									<label for="amount2"> Importe esperado: </label>
									<div class="input-group">
										<input type="text" name="amount" id="amount2" class="form-control" value="${tripi.amount}" />
										<div class="input-group-append">
											<span class="input-group-text">€</span>
										</div>
									</div>
								</div>
								<!-- Checkbox for deposit -->
								<div class="form-group">									
									<label for="checkbox2" class="container"> 
										<b class="emphasize">Reembolso previo:</b>
										<input type="checkbox" name="checkbox" id="checkbox2" class="checkbox" onclick="show2()">
										<span class="checkmark"></span>
									</label>
									<div class="input-group">
										<input type="text" name="deposit" id="deposit2" class="form-control"
										readonly onmousedown="return false;" /> <!-- Impide selección/modificación -->
										<div class="input-group-append">
											<span class="input-group-text">€</span>
										</div>
									</div>   
								</div>
								<span class="glyphicon glyphicon-calendar"></span>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Cerrar</button> 
										<button type="submit" class="btn btn-warning">Editar Viaje</button>
								</div>
										</form>
		
									</div>
		
								</div>
							</div>
						</div>
					
					</td>
						
						
						
						<td>Denegado</td>
						
				
					</c:if>
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
	<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	
	<!-- Bootstrap Date-Picker Plugin -->
	<!-- Include Date Range Picker -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
	<script>
	    $(document).ready(function(){
	        var date_input=$('input[name="startDate"]');//our date input has the name "startDate"
	        var date_input2=$('input[name="endDate"]');//our date input has the name "endDate"
	        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
	        date_input.datepicker({
	            format: 'dd/mm/yyyy',
	            container: container,
	            todayHighlight: true,
	            autoclose: true,
	        })
	        date_input2.datepicker({
	            format: 'dd/mm/yyyy',
	            container: container,
	            todayHighlight: true,
	            autoclose: true,
	        })
	    })
	</script>
	<script type="text/javascript">
		function show(){
			var alpha = .3; // Proporción de reembolso previo
			var value = document.getElementById("amount").value;
			var checkbox = document.getElementById("checkbox");
			var deposit = document.getElementById("deposit");
			
			if (checkbox.checked == true) {
				deposit.placeholder = value * alpha;
			} else {
				deposit.placeholder = "";
			}	
		}
	</script>
	<script type="text/javascript">
		function show2(){
			var alpha2 = .3; // Proporción de reembolso previo
			var value2 = document.getElementById("amount2").value;
			var checkbox2 = document.getElementById("checkbox2");
			var deposit2 = document.getElementById("deposit2");
			
			if (checkbox2.checked == true) {
				deposit2.placeholder = value2 * alpha2;
			} else {
				deposit2.placeholder = "";
			}	
		}
	</script>
</body>
</html>