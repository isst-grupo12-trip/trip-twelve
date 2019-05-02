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

<title>ModalTrip</title>
</head>
<body>

<!-- <shiro:lacksRole name="admin">
	No tienes permiso para ver el contenido de esta página <a class="nav-link" href="LogoutServlet">Iniciar sesión</a>
</shiro:lacksRole> -->

<shiro:hasRole name="employee">

<!-- <div class="modal fade" id="exampleModalEdicion" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document"> -->
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">New Trip
					Request</h5>
			</div>
			<div class="modal-body">
				<form action="EditTripServlet" method="post">
					<div class="form-group">
						<label for="destination"> Destino: </label> <input value="${trip.destiny}" type="text" name="destination" id="destination" class="form-control" placeholder="Ciudad"/>                
					</div>
					<div class="form-group ">
						<label class="control-label " for="startDate"> Fecha de ida: </label> 
						<div class="input-group">
						<input value="${trip.startDate}" class="form-control" id="startDate"
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
							<input value="${trip.endDate}" class="form-control" id="endDate"  name="endDate" placeholder="MM/DD/YYYY" type="text" />
							<div class="input-group-append">
								<div class="input-group-text">
									<i class="fa fa-calendar"> </i>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="motive"> Motivo del viaje: </label> <textarea type="text" name="motive" id="motive" class="form-control" placeholder="Introduzca motivo" rows="3">${trip.motive}</textarea>               
					</div>
					<div class="form-group">
						<label for="amount"> Importe esperado: </label>
						<div class="input-group">
							<input value="${trip.amount}" type="text" name="amount" id="amount" class="form-control" placeholder="Importe" />
							<div class="input-group-append">
								<span class="input-group-text">€</span>
							</div>
						</div>
					</div>
					<span class="glyphicon glyphicon-calendar"></span>
					<input type="hidden" name="email" value="${employee.email}" />
					<div class="modal-footer">
						<input type="hidden" name="email" value="${employee.email}" />
						<button formaction="EmployeeServlet" formmethod="get" class="btn btn-secondary">Close</button>
						<input type="hidden" name="tripId" value="${tripId}" />
						<button type="submit" class="btn btn-warning">Save changes</button>
					</div>
				</form>
				<!-- <form action="EmployeeServlet" method="get">
					<input type="hidden" name="email" value="${employee.email}" />
					<button type="submit" class="btn btn-secondary">Close</button>
				</form> -->
			</div>
		</div>
</shiro:hasRole>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

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