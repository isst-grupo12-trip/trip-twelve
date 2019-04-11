<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin View</title>
</head>
<body>
<shiro:user>
    Welcome back <shiro:principal />! Click <a href="LogoutServlet">here</a> to logout.
</shiro:user>
<hr>
	<h2>Vista de administrador</h2>
	<shiro:lacksRole name="admin">
	No tienes permiso para ver el contenido de esta página
</shiro:lacksRole>
	<shiro:hasRole name="admin">
		<!--  <h3>Crear profesor nuevo</h3>
		<form action="CreateProfessorServlet" method="post">
			<p>
				Nombre: <input type="text" name="name" />
			</p>
			<p>
				Email: <input type="text" name="email" />
			</p>
			<p>
				Password: <input type="password" name="password" />
			</p>
			<p>
				<button type="submit">Crear profesor</button>
			</p>
		</form>
		
		<h3>Listado de profesores</h3>
		<table border="1">
			<tr>
				<th>Nombre</th>
				<th>Email</th>
				<th>TFGs</th>
			</tr>
			<c:forEach items="${professor_list}" var="prof">
				<tr>
					<td>${prof.name }</td>
					<td>${prof.email }</td>
					<td>${fn:length(prof.advisedTFGs) }</td>
				</tr>
			</c:forEach>
		</table>
		
		<h3>Crear TFG nuevo</h3>
		<form action="CreateTFGServlet" method="post">
			<p>
				Nombre: <input type="text" name="name" />
			</p>
			<p>
				Email: <input type="text" name="email" />
			</p>
			<p>
				Password: <input type="password" name="password" />
			</p>
			<p>
				Título: <input type="text" name="title" />
			</p>
			<p>
				Tutor: <select name="advisor">
					<option value="" disabled selected>Elija un tutor</option>
					<c:forEach items="${ professor_list }" var="professori">
						<option value="${ professor.email }">
							${ professori.name }-${ professori.email }
						</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<button type="submit">Crear TFG</button>
			</p>
		</form>
		
		<h3>Listado de tfgs</h3>
		<table border="1">
			<tr>
				<th>Título</th>
				<th>Email alumno</th>
				<th>Nombre del alumno</th>
				<th>Email tutor</th>
				<th>Nombre del tutor</th>
				<th>Estado del TFG</th>
				<th>Memoria</th>
				<th>Acción requerida</th>
			</tr>
			<c:forEach items="${tfg_list}" var="tfgi">
				<tr>
					<td>${tfgi.title }</td>
					<td>${tfgi.email }</td>
					<td>${tfgi.name }</td>
					<td>${tfgi.advisor.email }</td>
					<td>${tfgi.advisor.name }</td>
					<td>${tfgi.status }</td>
					<td><c:if test="${tfgi.status > 3}">
							<form action="ServeFileServlet">
								<input type="hidden" name="email" value="${tfgi.email}" />
								<button type="submit">Descargar</button>
							</form>
						</c:if></td>
					<td><c:if test="${tfgi.status == 2}">
							<form action="Form3SecretaryServlet" method="post">
								<input type="hidden" name="email" value="${tfgi.email}" />
								<button type="submit">Aceptar tfg</button>
							</form>
						</c:if></td>
				</tr>
			</c:forEach>
		</table> -->
		<h3>Crear nuevo empleado</h3>
		<form action="CreateEmployeeServlet" method="post">
			<p>
				Email: <input type="text" name="email" />
			</p>
			<p>
				Password: <input type="password" name="password" />
			</p>
			<p>
				Nombre: <input type="text" name="name" />
			</p>
			<p>
				Supervisor: <select name="supervisorEmail">
					<option value="" disabled selected>Elija un supervisor</option>
					<c:forEach items="${ employee_list }" var="supervisori">
						<option value="${ supervisori.email }">
							${ supervisori.name }-${ supervisori.email }
						</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<button type="submit">Crear empleado</button>
			</p>
		</form>
		<h3>Listado de empleados</h3>
		<table border="1">
			<tr>
				<th>Nombre</th>
				<th>Email</th>
				<th>Supervisor</th>
			</tr>
			<c:forEach items="${employee_list}" var="employeei">
				<tr>
					<td>${employeei.name }</td>
					<td>${employeei.email }</td>
					<td>${employeei.supervisor }</td>
				</tr>
			</c:forEach>
		</table>
	</shiro:hasRole>
</body>
</html>