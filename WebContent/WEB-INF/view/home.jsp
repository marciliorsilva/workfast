<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="icon"  href="<%=request.getContextPath()%>/resources/img/icon/fivicon.png">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>home</title>
</head>
<body style="margin-left: 5%; margin-right: 5%;">
	<br />
	
	<div align="right" style="color: #6E6E6E; marginright: 2%;">Bem vindo, ${usuarioLogado.email}</div>
	<div align="right" style="color: #6E6E6E; marginright: 2%;">Bem vindo, ${usuarioLogado.tipo_acesso.descricao}</div>
</body>
</html>