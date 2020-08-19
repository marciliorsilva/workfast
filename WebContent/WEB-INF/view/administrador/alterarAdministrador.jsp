<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-BR">

<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="icon"  href="<%=request.getContextPath()%>/resources/img/icon/fivicon.png">
<!-- Required meta tags-->

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<!-- Title Page-->
<title>WorkFast - Area do Administrador</title>

<!-- Fontfaces CSS-->
<link href="<%=request.getContextPath()%>/resources/css/font-face.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/font-awesome-5/css/fontawesome-all.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">

<!-- Bootstrap CSS-->
<link
	href="<%=request.getContextPath()%>/resources/vendor/bootstrap-4.1/bootstrap.min.css"
	rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link
	href="<%=request.getContextPath()%>/resources/vendor/animsition/animsition.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/wow/animate.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/css-hamburgers/hamburgers.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/slick/slick.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" media="all">


<!-- Bootstrap CSS-->
<link
	href="<%=request.getContextPath()%>/resources/vendor/bootstrap.min.css"
	rel="stylesheet" media="all">


<!-- Main CSS-->
<link href="<%=request.getContextPath()%>/resources/css/theme-adm.css"
	rel="stylesheet" media="all">

</head>

<body class="animsition">

	<div class="page-wrapper">
		<!-- menu adm -->
		<c:import url="../administrador/menu.jsp" />

		<!-- PAGE CONTENT-->
		<div class="page-content--bgf7">


			<section class="p-t-60 p-b-20">
			<div class="container">
				<div class="row">
					<div class="col-md-12">

						<div style="text-align: center; color: red;">${mensagem}</div>

						<form action="updateAdm" method="post">
						
						<input type="hidden" value="${usuarioAdm.id}" name="id" >
						<input type="hidden" value="0" name="tipo_usuario" >
						<input type="hidden" value="2" name="tipo_acesso" >
							<div class="card">
								<div class="card-header">
									<strong>Administrador -</strong> <small> Formulario de
										Cadastro</small>
								</div>
								<div class="card-body card-block">
									<div class="form-group">
										<label for="nome" class=" form-control-label">Nome</label> <input
											type="text" id="nome" name="nome" placeholder="Digite o nome e sobrenome"
											class="form-control" value="${usuarioAdm.nome}" required="required">
									</div>

									<div class="form-group">
										<label for="email" class=" form-control-label">Email</label> <input
											type="email" id="email" name="email" placeholder="Digite o email"
											class="form-control" value="${usuarioAdm.email}" required="required">
									</div>

									<div class="form-group">
										<label for="senha" class=" form-control-label">Senha</label> <input
											type="password" id="senha" name="senha" placeholder="Digite uma senha"
											class="form-control" value="${usuarioAdm.senha}" required="required">
									</div>
									<div class="form-group">
										<label for="ativo" class=" form-control-label">Ativo</label> <select
											name="ativo" id="ativo" name="ativo" class=" form-control"
											required="required">

											<option value="1" selected="selected">Sim</option>
											<option value="0">Não</option>

										</select>

									</div>
									<div class="form-group">
										<label for="nivel" class=" form-control-label">Nivel</label> <select
											name="nivel_acesso" id="nivel_acesso" name="nivel_acesso" class=" form-control"
											required="required">
											<option value="selecione">Selecione uma opção</option>
											<c:if test="${usuarioLogado.nivel_acesso == '0'}">
                                               <option value="1">Master</option>
                                            </c:if>
											
											<option value="2">Comum</option>

										</select>

									</div>


								</div>
								<div class="card-footer">
									<div style="margin: 0 auto; float: right;">
										<button type="submit" class="btn btn-primary btn-sm">
											<i class="fa fa-dot-circle-o"></i> Cadastrar
										</button>
										<button type="reset" class="btn btn-danger btn-sm">
											<i class="fa fa-ban"></i> Resetar
										</button>
									</div>

								</div>
							</div>
						</form>


					</div>



				</div>
			</div>

			</section>

			<!-- COPYRIGHT-->

			<section class="p-t-60 p-b-20">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="copyright">
							<p>Copyright © 2018 WorkFast. Todos os direitos reservados..</p>
						</div>
					</div>
				</div>
			</div>
			</section>
			<!-- END COPYRIGHT-->
		</div>

	</div>

	<!-- Jquery JS-->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS-->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/bootstrap-4.1/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<!-- Vendor JS       -->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/slick/slick.min.js">
		
	</script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/wow/wow.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/animsition/animsition.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
		
	</script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/counter-up/jquery.waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/counter-up/jquery.counterup.min.js">
		
	</script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/circle-progress/circle-progress.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/perfect-scrollbar/perfect-scrollbar.js">
	</script> 
	<script
		src="<%=request.getContextPath()%>/resources/vendor/chartjs/Chart.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/select2/select2.min.js">
		
	</script> <!-- Main JS--> <script
		src="<%=request.getContextPath()%>/resources/js/main.js"></script>
		<script>
		$(document).ready(function() {
			$('#ativo').val("${usuarioAdm.ativo}");
			$('#nivel_acesso').val("${usuarioAdm.nivel_acesso}")	 
		});
		</script>
</body>

</html>
<!-- end document-->