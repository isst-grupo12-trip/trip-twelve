 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Receipt Image View</title>
</head>
<body>
<shiro:user>
    Welcome back <shiro:principal />! Click <a href="LogoutServlet">here</a> to logout.
</shiro:user>
<hr>
	<h2>Comprobante del recibo</h2>
	<shiro:hasRole name="employee">
	<img src="./ShowImageServlet?receiptId=${param.receiptId}" />
	</shiro:hasRole>
	<shiro:hasRole name="supervisor">
	<img src="./ShowImageServlet?receiptId=${param.receiptId}" />
	</shiro:hasRole>
</body>
</html>