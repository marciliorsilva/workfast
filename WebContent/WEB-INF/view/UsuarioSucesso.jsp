<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon"  href="<%=request.getContextPath()%>/resources/img/icon/fivicon.png">
<title>Insert title here</title>
</head>
<body>
	<center>
		<img id="img_logo"
			src="<%=request.getContextPath()%>/resources/img/logo_workfast.png"
			class="img-responsive">
	</center>

	<h1 style='text-align: center; font-size: 3em;'>Você foi cadastrado com sucesso!!</h1><br>
	
	<center>
		<img style="width: 150px; height: 120px;" id="img_logo"
			src="<%=request.getContextPath()%>/resources/img/aceito.png"
			class="img-responsive">
	</center>
	
	
	<h3 style='text-align: center; font-color: blue;'><b>Você será encaminhando para a página de efetuar login, aguarde...</b></h3>
	

	 <meta http-equiv="refresh" content="5; URL=entrar">
</body>
</html>