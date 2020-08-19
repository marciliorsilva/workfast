<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<!-- Importando a biblioteca Taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon"  href="<%=request.getContextPath()%>/resources/img/icon/fivicon.png">
<title>WorkFast</title>

<!-- Boostrap via CDN -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Fonte Icons -->
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">


<!-- Fonte Google -->
<link href="https://fonts.googleapis.com/css?family=PT+Serif"
	rel="stylesheet">

<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Jquery validate -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/localization/messages_pt_BR.js"></script>


<!-- Código JavaScript desta Página(Página de cadastro) -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/cadastro.js"></script>

<!-- Código css desta Página(Página de cadastro) -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/cadastro.css" />

</head>
<body>

	<div class="container">

		<div>
			<img id="img_logo"
				src="<%=request.getContextPath()%>/resources/img/logo_workfast.png"
				class="img-responsive">
		</div>


		<div class="panel panel-default col-sm-5" id="container_cadastro">
			<h2 id="txt_cadastrar">Cadastrar-se</h2>

			<!-- Formulário de cadastro-->
			<div class="panel-body">
				<form action="incluirUsuario" id="form_cadastro" method="post">
					<div class="form-group">
						<label for="nome">Nome:</label> <input type="text"
							class="form-control" id="nome" maxlength="70"
							placeholder="Digite seu nome e sobrenome" name="nome">
					</div>

					<div class="form-group">
						<label for="email">E-mail:</label> <input type="email"
							class="form-control" id="email" maxlength="50" placeholder="Digite  seu e-mail"
							name="email">
					</div>
					
					<input type="hidden" value="img_avatar.png" name="foto">


					<div class="form-group">
						<label>Senha:</label>
						<div class="row">
							<div class="col-sm-10">
								<input type="password" class="form-control" id="senha"
									placeholder="Digite uma senha" maxlength="18" name="senha">
							</div>

							<div class="col-sm-2">
								<span class="input-group-btn">
									<button style="float: right;" id="olho" type="button"
										class="btn btn-alert" data-toggle="tooltip"
										data-placement="top"
										title="Clique aqui para visualizar sua senha">
										<i class="glyphicon glyphicon-eye-open"></i>
									</button>
								</span>
							</div>
						</div>
					</div>



					<div class="form-group">
						<label for="repetir_senha">Confirmar senha:</label> <input
							type="password" class="form-control" id="repetir_senha"
							name="senha2" maxlength="18" placeholder="Confirme sua senha">
					</div>

					<div class="form-group">
						<label for="tipo">Tipo:</label>
						<div>
							<div class="form-group">
								<select id="tipo_usuario" name="tipo_usuario"
									class="form-control" required>
									<option value="0">Selecione</option>
									<option value="1">Físico</option>
									<option value="2">Jurídico</option>

								</select>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label>Acessar como:</label>
						<div>
							<div class="form-group">
								<select id="tipo_acesso" name="tipo_acesso" class="form-control">
									<option value="">Selecione</option>
									<c:forEach items="${listaTipoAcesso}" var="obj">
										<c:if test="${obj.descricao != 'Administrador'}">
											<option value="${obj.idTipoAcesso}">${obj.descricao}</option>
										</c:if>

									</c:forEach>
								</select>
							</div>
						</div>
					</div>


					<div class="checkbox">
						Aceite os <a data-toggle="tooltip" data-placement="top"
							title="Clique aqui para ler os termos">termos de uso</a> <label><input
							name="contrato" type="checkbox" value="">&nbsp &nbsp </label>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" id="button_cadastrar"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-ok"></span> Cadastrar-se
							</button>
						</div>
					</div>

					<p id="p_mensagem">
						Já tem uma conta? <a href="entrar" style="color: red;"
							data-toggle="tooltip" data-placement="top"
							title="Se clicar você será redirecionado para a página de login">Fazer
							login</a>
					</p>
					<input name="ativo" type="hidden" value="1"> <input
						name="nivel_acesso" type="hidden" value="1">
				</form>
			</div>
			
			<div>
					<center>
						<p id="p_mensagem">
							Quer voltar para página inicial? <a href="index"
								style="color: blue;" data-toggle="tooltip" data-placement="top"
								title="Se clicar você será redirecionado para a página inicial">Clique
								aqui</a>
						</p>
					</center>
				</div>
		</div>
	</div>
	</div>




</body>
</html>