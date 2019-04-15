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
					
					<li class="nav-item">
						<a class="nav-link" href="#create-receipt">Crear Factura</a>
					</li>
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
										<label for="motive"> Motivo: </label> <textarea name="motive" id="motive" class="form-control" placeholder="Introduzca motivo" rows="3"> </textarea>               
									</div>
									
									
									<div class="form-group">
										<label for="amount"> Comprobante: </label>
										<div class="input-group">
											<input type="file" name="attachment" id="attachment" class="form-control" />
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
			<shiro:lacksRole name="employee">
				No eres empleado
			</shiro:lacksRole>
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
<!-- 	<div class="p-2 order-last text-center card"> -->
<%-- <shiro:lacksRole name="supervisor"> --%>
<!-- 		<div class="card-body"> -->
<!-- 		<h2 class="card-title">Crear factura nueva</h2> -->
<!-- 		<form action="CreateReceiptServlet" method="post" enctype="multipart/form-data"> -->
<!-- 			<p> -->
<!-- 				Motivo: <input type="text" name="motive" /> -->
<!-- 			</p> -->
<!-- 			<p> -->
<!-- 				Comprobante: <input type="file" name="attachment" /> -->
<!-- 			<p> -->
<!-- 				Importe: <input type="text" name="amount" /> -->
<!-- 			</p> -->
<%-- 			<input type="hidden" name="tripId" value="${trip.tripId}" />	 --%>
<!-- 			<p> -->
<!-- 				<button type="submit">Crear factura</button> -->
<!-- 			</p> -->
<!-- 		</form> -->
<!-- 		</div> -->
<%-- </shiro:lacksRole> --%>
<!-- 	</div> -->
		
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
					<td>${receipti.amount } €</td>
					<td>
					<form action="ReceiptImageView.jsp" action="post">
						<input type="hidden" name="receiptId" value="${receipti.receiptId}" />
						<button type="submit">Ver comprobante</button>
					</form>	
					</td>
					<td>${receipti.motive }</td>
 					
  				</tr>
  				</tbody>
  				
  			</c:forEach>
 		</table>
 		
 	</div>
</div>
 		

</body>
</html>