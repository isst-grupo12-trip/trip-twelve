 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee View</title>
</head>
<body>
<shiro:user>
    Welcome back <shiro:principal />! Click <a href="LogoutServlet">here</a> to logout.
</shiro:user>
<hr>
	<h2>Vista de empleado</h2>
	<shiro:lacksRole name="employee">
	No tienes permiso para ver el contenido de esta página
</shiro:lacksRole>
	<shiro:hasRole name="employee">
		<h3>Crear Viaje nuevo</h3>
		<form action="CreateTripServlet" method="post">
			<p>
				Destino: <input type="text" name="destination" />
			</p>
			<p>
				Fecha de Ida: <input type="text" name="startDate" />
			</p>	
			<p>
				Fecha de Vuelta: <input type=text name="endDate" />
			</p>
			<p>
				Motivo del viaje: <input type="text" name="motive" />
			</p>
			<p>
				Importe Esperado: <input type="text" name="amount" />
			</p>
			<p>
				<button type="submit">Crear Viaje</button>
			</p>
		</form>
		
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
 					<!-- Falta añadir la acción requerida -->
 					<td><c:if test="${tripi.status > 3}"> 
 							<form action="ServeFileServlet">
 								<input type="hidden" name="email" value="${tfgi.email}" /> 
								<button type="submit">Descargar</button>
							</form> 
 						</c:if></td>
					<td><c:if test="${tripi.status == 2}"> 
							<form action="Form3SecretaryServlet" method="post">
 								<input type="hidden" name="email" value="${tfgi.email}" /> 
								<button type="submit">Aceptar tfg</button> 
 							</form> 
 						</c:if></td> 
 				</tr> 
 			</c:forEach> 
 		</table>		 
	</shiro:hasRole>
</body>
</html>