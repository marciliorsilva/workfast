<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-BR">

<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Required meta tags-->

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<!-- Title Page-->
<title>WorkFast - Area do Prestador</title>

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
<link
	href="<%=request.getContextPath()%>/resources/css/theme-prestador.css"
	rel="stylesheet" media="all">

<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!-- Jquery validate -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>

<!-- Código JavaScript desta Página(Página de cadastro) -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/prestador/cadastroPrestadorFisico.js"></script>


</head>

<body class="animsition">

	<div class="page-wrapper">
		<!-- menu adm -->
		<c:import url="../prestador/menu.jsp" />

		<section class="au-breadcrumb m-t-75" style="margin-bottom:60px;">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="au-breadcrumb-content">
							<div class="au-breadcrumb-left" style="margin-top: 5px;">
								<h1 class="title-4">Serviços</h1>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		</section>

		<section>
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="row">

					<!-- Conteiner de listagem de candidatos -->
					<div class="container-fluid" style="margin-top: 30px;">
						<div class="fontawesome-list-wrap">

							<div class="login-form">


								<div class="form-group">
									<label>Profissão</label> <select required="required"
										id="profissao" name="profissao" class="form-control">
										<option value="">Selecione</option>
										<c:forEach items="${listaProfissao}" var="obj">

											<option value="${obj.idProfissao}">${obj.nome}</option>


										</c:forEach>

									</select>
								</div>


							</div>
						</div>




					</div>


				</div>

			</div>
		</div>
		<br>
		<br>
		<div class="form-group text-center">
		  <button class="btn btn-primary" data-toggle="tooltip"
			data-placement="top" id="btnCadastrar" title="Salvar">Salvar</button>
	    </div>
		
	</div>

	</section>
	<br>

	<section>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="copyright">
					<p>Copyright © 2018 WorkFast. Todos os direitos reservados.</p>
				</div>
			</div>
		</div>
	</div>
	</section>

	<script type="text/javascript">
		var idUsuario = "${usuarioLogado.idUsuario}";

		var btnCadastrar = document.getElementById("btnCadastrar");
		btnCadastrar.addEventListener('click', function() {

			var idProfissao = $("#profissao").val();

			if (idProfissao == null || idProfissao == "") {
				alert("Selecione uma profissão.");
			} else {
				//encaminhando os valores do formulario para ser processadas 
				$.post('saveProfissaoUsuario', {
					idProfissao : idProfissao,
					idUsuario : idUsuario

				}, function(dadosJSON) {
					if (dadosJSON == true) {
						alert("Voce ja esta vinculado(a) com essa profissão!");
					} else {
						alert("Profissão vinculada com sucesso!");
						window.location = "paginaEspecializacao";

					}

				});

			}

			return false;// impedindo o encaminhamento

		});
	</script>


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
		src="<%=request.getContextPath()%>/resources/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/chartjs/Chart.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/select2/select2.min.js">
		
	</script>

	<!-- Main JS-->
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>

</body>

</html>
<!-- end document-->