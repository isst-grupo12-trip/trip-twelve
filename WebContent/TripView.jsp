 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/detailsstyle.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css">

<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />

<title>Trip</title>
</head>
<body>


<shiro:lacksRole name="admin">
	No tienes permiso para ver el contenido de esta página <a class="nav-link" href="LogoutServlet">Iniciar sesión</a>
</shiro:lacksRole>


<div class="container-fluid principal">


	<nav class="navbar navbar-expand-md navbar-light bg-light fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand mb-0 h1" href="#"><img
				src="img/travel.png" style="width: 40px; margin-right: 5px;">TripTwelve</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
				<shiro:hasRole name="employee">
					<li class="nav-item">
						<a class="nav-link" href="#create-receipt">Crear Factura</a>
					</li>
				</shiro:hasRole>
					<li class="nav-item"><a class="nav-link" href="#info">Informacion</a></li>
					<li class="nav-item"><a class="nav-link" href="#receipts">Facturas</a>
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


	<div id="create-receipt" class="container-fluid">
		
		
<shiro:lacksRole name="supervisor">


		<div class="row justify-content-center align-items-center" id="loginForm" style="height: 100vh; ">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-warning btn-circle btn-xl" data-toggle="modal" data-target="#exampleModal">
				  New Bill
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Create new bill</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="CreateReceiptServlet" method="post" enctype="multipart/form-data">

									<div class="form-group">
										<label for="motive"> Motivo: </label> 
										<textarea name="motive" id="motive" class="form-control" placeholder="Introduzca motivo" rows="3"> </textarea>               
									</div>

									<div class="form-group">
										<label for="attachment"> Comprobante: </label>
										<div class="input-group">
											<div class="custom-file">
												<input type="file" class="custom-file-input" id="attachment" name="attachment">
												<label class="custom-file-label" for="attachment">Choose file</label>
											</div>
										</div>
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
									<input type="hidden" name="tripId" value="${trip.tripId}" />	
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-warning">Create bill</button>
									</div>
								</form>

							</div>

						</div>
					</div>
				</div>
			</div>
			
			
</shiro:lacksRole>

		
	</div>
</div>



















	

<div  id="info" class="">
<div class="container-fluid d-flex flex-row  text-center align-items-center justify-content-center" style="height: 100vh;   background-image: linear-gradient(to right, #207ce5 , #fedc44);">
		
		
    <div class="p-2 order-first text-center card x3 ">
    
    
	    <div class="card-header">
	    	<h3>Detalles del viaje</h3>
	    </div>
	    
			<shiro:hasRole name="supervisor">
				<h6 style="margin-bottom:5px; margin-top:5px"> Eres supervisor </h6>
			</shiro:hasRole>
			
		<div class="card-body">
		<p class="card-text">
			Destino: ${trip.getDestiny()}
		</p>
		<p class="card-text">
			Fecha de inicio: ${trip.getStartDate()}
		</p>
		<p class="card-text">
			Fecha de fin: ${trip.getEndDate()}
		</p>
		<p class="card-text">
			Motivo: ${trip.getMotive()}
		</p>
    </div>		
		
	</div>
</div>
		
</div>


		
<div id="receipts" class="container-fluid">
	<div class="row justify-content-center align-items-center" id="loginForm" style="height: 100vh">
		<table class="table ">
		  	<thead class="thead-light">
			<tr> 
				<th scope="col">Importe</th>
				<th scope="col">Comprobante</th>
				<th scope="col">Motivo</th>
 			</tr>
  			<c:forEach items="${receipt_list}" var="receipti" varStatus="loop">
  			<tbody  id="accordion">
				<tr class="accordion-toggle">
  				<tr>
					<td>${receipti.amount} €</td>
					<td>


						<!-- Button trigger modal -->
						<button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#exampleModal1">Ver comprobante</button>

						<!-- Modal -->
						<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Receipt</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body text-center">
											<shiro:hasRole name="employee">
													<img src="./ShowImageServlet?receiptId=${receipti.receiptId}" style="max-width:100%; max-height:auto"/>
											</shiro:hasRole>
											<shiro:hasRole name="supervisor">
													<img src="./ShowImageServlet?receiptId=${receipti.receiptId}" style="max-width:100%; max-height:auto"/>
											</shiro:hasRole>
										</div>
		
								</div>
							</div>
						</div>
						
						

					</td>
					<td>${receipti.motive}</td>
 					
  				</tr>
  				</tbody>
  				
  			</c:forEach>
 		</table>
 		
 	</div>
</div>
 		
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script>
		$('#attachment').on('change', function() {
			//get the file name
			var fileName = $(this).val();
			fileName = fileName.replace("C:\\fakepath\\","");
			//replace the "Choose a file" label
			$(this).next('.custom-file-label').html(fileName);
		})
	</script>



</body>
</html>