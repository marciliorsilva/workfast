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

		<!-- Conteudo-->
		<div class="page-content--bgf7">

			<!-- DATA TABLE-->
			<section class="p-t-20">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<br>
						<h3 class="title-5 m-b-35">Administradores</h3>
						<hr class="line-seprate">
						<br>
						<div class="table-data__tool">
							<div class="table-data__tool-left">

								<div class="form-group">

									<input type="text" id="txtPesquisa" name="pesquisa"
										placeholder="Pesquise aqui.." class="form-control">

								</div>

							</div>
							<div class="table-data__tool-right">
								<form action="cadastrarAdministrador">
									<button type="submit"
										class="au-btn au-btn-icon au-btn--azul au-btn--small"
										style="background-color:">
										<i class="zmdi zmdi-plus"></i>Novo Administrador
									</button>
								</form>


							</div>
						</div>
						
						<div class="table-responsive table-responsive-data2"
							style="padding-bottom: 20%">
							<div style="text-align: center; color: red;">${mensagem}</div>
							<table class="table table-data2">
								<thead>
									<tr>

										<th>Nome</th>
										<th>Email</th>
										<th>Nivel</th>

										<th>Acesso</th>
									</tr>
								</thead>
								<tbody id="tbAdm">
									<c:forEach var="usuarioAdm" items="${listaUsuarioAdm}">
										<tr class="tr-shadow">

											<td width="180">${usuarioAdm.nome}</td>

											<td><span>${usuarioAdm.email}</span></td>
											<td>
											
													<c:if test="${usuarioAdm.nivel_acesso == '1'}">
														<span>Master</span>
													</c:if>
													
													<c:if test="${usuarioAdm.nivel_acesso == '2'}">
														<span>Comum</span>
													</c:if>
													
											</td>

											<td><c:choose>
													<c:when test="${usuarioAdm.ativo == '1'}">
														<span>Ativo</span>
													</c:when>
													<c:otherwise>
														<span>Bloqueado</span>
													</c:otherwise>
												</c:choose></td>


											<td>
												<div class="table-data-feature">
													
														<c:choose>
															<c:when test="${usuarioAdm.ativo == '1'}">
																<a href="bloquearUsuario?id=${usuarioAdm.idUsuario}" class="item" data-toggle="tooltip"
																	data-placement="top" title="Bloquear">
																	<i class="zmdi zmdi-lock"></i>
																 </a>
																
															</c:when>
															<c:otherwise>
																<a href="desbloquearUsuario?id=${usuarioAdm.idUsuario}" class="item" data-toggle="tooltip"
																	data-placement="top" title="Desbloquear">
																	 <i class="zmdi zmdi-lock-open"></i>
																 </a>
															</c:otherwise>
														</c:choose>

													

													
													<a href="editAdm?id=${usuarioAdm.idUsuario}" class="item" data-toggle="tooltip"
														data-placement="top" title="Editar">
														<i class="zmdi zmdi-edit"></i>
													  </a>

													

													<a href="deleteAdm?id=${usuarioAdm.idUsuario}"  class="item" data-toggle="tooltip"
															data-placement="top" title="Excluir">
															<i class="zmdi zmdi-delete"></i>
													</a>

													


												</div>
											</td>

										</tr>
										<tr class="spacer"></tr>

									</c:forEach>




								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			</section>
			<!-- END DATA TABLE-->


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


			<script>
	function bloquear(id) {
		swal({
		  title: "Você tem certeza?",
		  text: "Você bloqueará este prestador de serviço do sistema",
		  icon: "error",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {  
			window.location = "bloquearUsuario?id="+id;
		  }

		});  
}
	
	
	function desbloquear(id) {
		swal({
		  title: "Você tem certeza?",
		  text: "Você desbloquerá este prestador de serviço do sistema",
		  icon: "error",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {  
			window.location = "bloquearUsuario?id="+id;
		  }

		});  
}
	</script>
	
	<!-- Plugin de alr -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
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

	<script>
		$(document).ready(function(){
		  $("#txtPesquisa").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#tbAdm tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
		</script>

</body>

</html>
<!-- end document-->