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

<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!-- Main CSS-->
<link
	href="<%=request.getContextPath()%>/resources/css/theme-prestador.css"
	rel="stylesheet" media="all">

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

		<section class="p-t-20">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="table-data__tool">
					    <div class="table-data__tool-left">

								<div class="form-group">

									<input type="text" id="txtPesquisa" name="pesquisa"
										placeholder="Pesquise aqui.." class="form-control">

								</div>

							</div>
						<div class="table-data__tool-right">
						   
							<a href="servicosAdd">
								<button class="au-btn au-btn-icon au-btn--green au-btn--small">
									<i class="zmdi zmdi-plus"></i>Adicionar Serviço
								</button>
							</a>
						</div>
					</div>
					<div class="table-responsive table-responsive-data2">
						<table class="table table-data2">
							<thead>
								<tr>
									<th>Categoria</th>
									<th>Serviço</th>
									<th>Atuação</th>
								</tr>
							</thead>
							<tbody id="tbServico" >
							<c:forEach var="servicosPrestador" items="${listaUsuarioServico}">
										<tr class="tr-shadow">

											<td width="180">${servicosPrestador.servico.categoriaServico.nome}</td>

											<td><span>${servicosPrestador.servico.nome}</span></td>
											<td>
											
											 <select  onclick="carregarCidades(${servicosPrestador.idUsuarioServico})" id="${servicosPrestador.idUsuarioServico}" class="form-control">
											    
											     

										     </select>
													
											</td>

									


											<td>
												<div class="table-data-feature">
													
													  <button onclick="editar(${servicosPrestador.idUsuarioServico})" class="item" data-toggle="tooltip"
														data-placement="top" title="Editar">
															<i class="zmdi zmdi-edit"></i>
													</button>

													

													<button onclick="excluir(${servicosPrestador.idUsuarioServico})" class="item botao_excluir" data-toggle="tooltip"
															data-placement="top" title="Excluir">
															<i class="zmdi zmdi-delete"></i>
													</button>

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

		<section  >
		<div class="container-fluid" style="margin-top: 70%;">
			<div class="row">
				<div class="col-md-12">
					<div class="copyright">
						<p>Copyright © 2018 WorkFast. Todos os direitos reservados.</p>
					</div>
				</div>
			</div>
		</div>
		</section>

	</div>

	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		  $('select').click();
		  
		  
		  
	  });
	
	function excluir(id) {
 				swal({
					  title: "Você tem certeza?",
					  text: "Uma vez deletado, você não poderá recuperar este serviço",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {  
						window.location = "servicoDelete?id="+id;
					  }
			
					});  
	}
	
	function editar(id) {
			swal({
			  title: "Você tem certeza?",
			  text: "Você será redirecionado para página de edição",
			  icon: "info",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {  
				window.location = "servicosEdit?id="+id;
			  }
	
			});  
}
	
	function carregarCidades(idUsuarioServico){
		$
		.post(
				'listarCidades',
				{
					idUsuarioServico : idUsuarioServico

				},
				function(dadosJSON) {
					var linhas = '';
					linhas += "<option value='' >Cidades </option>";

					$(dadosJSON)
					 
							.each(
									function(i) {
                                        
                                        	 linhas += "<option>"+ dadosJSON[i].cidade.nome + "</option>";
                                         
										

									});
					$('#'+idUsuarioServico).html(linhas);

				});

	}
	</script>
	
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
		    $("#tbServico tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
		</script>

</body>

</html>
<!-- end document-->