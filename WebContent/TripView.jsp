 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trip View</title>
</head>
<body>
<shiro:user>
    Welcome back <shiro:principal />! Click <a href="LogoutServlet">here</a> to logout.
</shiro:user>
<hr>
	<h2>Detalles del viaje</h2>
	<shiro:lacksRole name="employee">
	No tienes permiso para ver el contenido de esta página
</shiro:lacksRole>
	<shiro:hasRole name="employee">
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
		<h3>Crear factura nueva</h3>
		<form action="CreateReceiptServlet" method="post">
			<p>
				Comprobante: <button name="receipt" action="CreateReceiptServlet">Añadir comprobante</button>
			</p>
			<p>
				Importe: <input type="text" name="price" />
			</p>
			<p>
				<button type="submit">Crear factura</button>
			</p>
		</form>
		
		<h3>Listado de facturas</h3>
 		<table border="1">
			<tr> 
				<th>Importe</th>
				<th>Comprobante</th>
 			</tr>
 			<!-- <c:forEach items="${trip_list}" var="tripi"> 
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
 						</c:if>
 						<c:if test="${tripi.state == 0}"> 
 							Pendiente de aceptacion
 						</c:if>
					</td>
					<c:if test="${tripi.state == 1}"> 
						<td>
 							<form action="TripServlet" method="post">
 								<input type="hidden" name="tripId" value="${tripi.tripId}" /> 
								<button type="submit">Ver detalles</button>
							</form>  
						</td>
 					</c:if>
 				</tr> 
 			</c:forEach> -->
 		</table>		 
	</shiro:hasRole>
</body>
</html>