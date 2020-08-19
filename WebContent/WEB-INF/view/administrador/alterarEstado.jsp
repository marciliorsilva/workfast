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
                       <div><center>${msg}</center></div>
						<form action="updateEstado" method="post" >
							<div class="card">
								<div class="card-header">
									<strong>Estado - UF -</strong> <small> Formulario de
										Alteração</small>
								</div>
								<input type="hidden" name="idEstado" value="${estado.idEstado}">
								<div class="card-body card-block">
									<div class="form-group">
										<label for="nome" class=" form-control-label">Nome</label> <input
											type="text" id="nome" name="nome" placeholder="Digite o nome do Estado"
											class="form-control" required="required" value="${estado.nome}">
									</div>

									<div class="form-group ">
										<label for="descricao" class=" form-control-label">Descrição</label> 
										
                                            <input
											type="text" id="uf" name="uf" placeholder="Digite a sigla"
											class="form-control" required="required" value="${estado.uf}">
                            
									</div>

									


								</div>
								<div class="card-footer">
									<div style="margin: 0 auto; float: right;">
										<button type="#" class="btn btn-primary btn-sm">
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
	<scrip
		src="<%=request.getContextPath()%>/resources/vendor/perfect-scrollbar/perfect-scrollbar.js">
	</script> <script
		src="<%=request.getContextPath()%>/resources/vendor/chartjs/Chart.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/select2/select2.min.js">
		
	</script> <!-- Main JS--> <script
		src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>

</html>
<!-- end document-->