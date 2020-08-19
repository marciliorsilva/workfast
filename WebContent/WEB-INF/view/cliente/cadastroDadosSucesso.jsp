<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon"  href="<%=request.getContextPath()%>/resources/img/icon/fivicon.png">
<meta http-equiv="refresh" content="3; URL=paginaInicialCliente">
<title>Workfast</title>
</head>
<body>
<center>
	<center>
		<img id="img_logo"
			src="<%=request.getContextPath()%>/resources/img/logo_workfast.png"
			class="img-responsive">
	</center>
	
	<h1>Dados atualizados com sucesso!<br> 
	${usuarioLogado.nome}, voce está sendo encaminhado para pagina inicial!</h1><br><br> 
	
		<center>
		<img style="width: 150px; height: 120px;" id="img_logo"
			src="<%=request.getContextPath()%>/resources/img/aceito.png"
			class="img-responsive">
	</center>
</center>
</body>
</html>