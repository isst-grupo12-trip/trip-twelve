 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Supervisor View</title>
</head>
<body>
<shiro:user>
    Welcome back <shiro:principal />! Click <a href="LogoutServlet">here</a> to logout.
</shiro:user>
<hr>
	<h2>Vista de supervisor</h2>
	<shiro:lacksRole name="supervisor">
	No tienes permiso para ver el contenido de esta página
</shiro:lacksRole>
	<shiro:hasRole name="supervisor">
			
		<h3>Listado de Viajes</h3>
 		<table border="1">
			<tr> 
				<th>Destino</th>
				<th>Fecha de Ida</th>
 				<th>Fecha de Vuelta</th> 
				<th>Motivo del viaje</th> 
				<th>Importe Esperado</th> 
 				<th>Acción requerida</th> 
 			</tr>
 			<c:forEach items="${trip_list}" var="tripi"> 
 				<tr> 
					<td>${tripi.destiny }</td> 
 					<td>${tripi.startDate }</td> 
 					<td>${tripi.endDate }</td> 
 					<td>${tripi.motive }</td>
					<td>${tripi.amount }</td> 
<!--  					Falta añadir la acción requerida -->
 					<td><c:if test="${tripi.state == 0}"> 
 							<form action="ForwardStatusServlet" method="post">
 								<input type="hidden" name="tripId" value="${tripi.tripId}" />
 								<input type="hidden" name="isSupervisor" value="${true}" />
								<button type="submit">Aceptar Viaje</button>
							</form> 
 						</c:if>
						<c:if test="${tripi.state == 2}"> 
							<form action="ForwardStatusServlet" method="post">
 								<input type="hidden" name="tripId" value="${tripi.tripId}" /> 
 								<input type="hidden" name="isSupervisor" value="${true}" />
								<button type="submit">Aceptar Reintegro</button> 
 							</form> 
 						</c:if>
					</td> 
 				</tr> 
 			</c:forEach> 
 		</table>		 
	</shiro:hasRole>
</body>
</html>