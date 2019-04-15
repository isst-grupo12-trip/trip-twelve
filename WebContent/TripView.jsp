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
					<li class="nav-item"><a class="nav-link" href="#info">Informacion</a></li>
					<li class="nav-item">
						<a class="nav-link" href="#create-receipt">Crear Factura</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#receipts">Facturas</a>
					</li>
					<li class="nav-item"><shiro:user>
							<a class="nav-link" href="LogoutServlet">Logout</a>
						</shiro:user></li>
				</ul>
			</div>
		</div>
	</nav>




	<h2>Detalles del viaje</h2>
	<shiro:lacksRole name="employee">
	No eres empleado
	</shiro:lacksRole>
	
		<p>
			Destino: ${trip.getDestiny()}
		</p>
		<p>
			Fecha de inicio: ${trip.getStartDate()}
		</p>
		<p>
			Fecha de fin: ${trip.getEndDate()}
		</p>
		<p>
			Motivo: ${trip.getMotive()}
		</p>
		
		<shiro:lacksRole name="supervisor">
		
		<h3>Crear factura nueva</h3>
		<form action="CreateReceiptServlet" method="post" enctype="multipart/form-data">
			<p>
				Motivo: <input type="text" name="motive" />
			</p>
			<p>
				Comprobante: <input type="file" name="attachment" />
			<p>
				Importe: <input type="text" name="amount" />
			</p>
			<input type="hidden" name="tripId" value="${trip.tripId}" />	
			<p>
				<button type="submit">Crear factura</button>
			</p>
		</form>
		</shiro:lacksRole>

	

		
<div id="receipts" class="container-fluid">
	<div class="row justify-content-center align-items-center" id="loginForm" style="height: 100vh">
		<table class="table ">
		  	<thead class="thead-light">
			<tr> 
				<th scope="col">Motivo</th>
				<th scope="col">Importe</th>
				<th scope="col">Comprobante</th>
 			</tr>
  			<c:forEach items="${receipt_list}" var="receipti" varStatus="loop">
  			<tbody  id="accordion">
				<tr class="accordion-toggle">
  				<tr>
					<td>${receipti.motive }</td>
					<td>${receipti.amount }</td>
					<td>
					<form action="ReceiptImageView.jsp" action="post">
						<input type="hidden" name="receiptId" value="${receipti.receiptId}" />
						<button type="submit">Ver comprobante</button>
					</form>	
					</td>
 					
  				</tr>
  				</tbody>
  				
  			</c:forEach>
 		</table>
 		
 		</div>
 		</div>
</body>
</html>