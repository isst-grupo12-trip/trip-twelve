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



<title>Receipt Image View</title>
</head>










<body>


<shiro:user>
    Welcome back <shiro:principal />! Click <a href="LogoutServlet">here</a> to logout.
</shiro:user>





	
	
	
	
	
	
	
<shiro:lacksRole name="admin">
	No tienes permiso para ver el contenido de esta página <a class="nav-link" href="LogoutServlet">Iniciar sesión</a>
</shiro:lacksRole>
	
	
	
	
	
	<hr>
	<h2>Comprobante del recibo</h2>
	

	<div id="trip-receipt" class="container-fluid">
		<div class="row justify-content-center align-items-center" id="loginForm" style="height: 100vh; ">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-warning btn-circle btn-xl" data-toggle="modal" data-target="#exampleModal">
				  View Receipt
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Receipt</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
									<shiro:hasRole name="employee">
										<img src="./ShowImageServlet?receiptId=${param.receiptId}" />
									</shiro:hasRole>
							</div>

						</div>
					</div>
				</div>
			</div>
					
	</div>
	
	
	
	
	
	
	
	
	<shiro:hasRole name="employee">
	<img src="./ShowImageServlet?receiptId=${param.receiptId}" />
	</shiro:hasRole>
	
	
	
</body>
</html>