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
		
		<h3>Listado de facturas</h3>
 		<table border="1">
			<tr> 
				<th>Motivo</th>
				<th>Importe</th>
				<th>Comprobante</th>
 			</tr>
  			<c:forEach items="${receipt_list}" var="receipti"> 
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
  			</c:forEach>
 		</table>		 
	</shiro:hasRole>
</body>
</html>