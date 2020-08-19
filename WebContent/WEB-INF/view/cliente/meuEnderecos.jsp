<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="icon"  href="<%=request.getContextPath()%>/resources/img/icon/fivicon.png">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Required meta tags-->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<!-- Title Page-->
<title>WorkFast - Cliente</title>

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



<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>


<!-- Main CSS-->
<link
	href="<%=request.getContextPath()%>/resources/css/theme-cliente.css"
	rel="stylesheet" media="all">




</head>


<body class="animsition">

	<c:import url="../cliente/menu.jsp" />


	<!-- Container de conteúdo-->
	<div class="main-content main-content--pb30">
		<div class="section__content section__content--p30">

			<h2 style="text-align: center;">
				<b>Meus Endereços</b>
			</h2>



			<div class="row form-group" style="float: right;">
				<div class="col col-md-3">
					<a href="adicionarEndereco">
						<button type="button" class="btn btn-primary">Adicionar
							novo endereço</button>
					</a>
				</div>
			</div>
			<br>
			
			<c:if test="${listaEndereco.size() == 0}">
			<br><br>
				<h4 style="text-align: center;color: red;">Você ainda não tem nenhum endereço, cadastre um.</h4>
			</c:if>
			
						<c:if test="${not empty mensagemRemocao}">
							<br><div class="alert alert-success alert-dismissible">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								${mensagemRemocao}
							</div><br>
						</c:if>

			<!-- Conteiner de listagem de endereços -->
			<c:forEach var="endereco" items="${listaEndereco}">
			<div class="container-fluid" style="margin-top: 30px;">
				<div class="fontawesome-list-wrap">
					<section>
					<div class="table-responsive table-responsive-data2">
						<table class="table table-data2">
							<thead>
								<tr>
									<th>CPE:</th>
									<th>RUA:</th>			
									<th>BAIRRO:</th>
									<th>Nº DA CASA:</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							
								<tr>
									<td>${endereco.cep}</td>
									<td>${endereco.rua}</td>
									<td>${endereco.bairro}</td>
									<td>${endereco.numeroCasa}</td>
					
									<td>
										<button onclick="editar(${endereco.id})" class="btn btn-primary" data-toggle="tooltip"
											data-placement="top"  title="Editar Endereço">
										 <i class="fas fa-edit"></i>
										</button>

										<button onclick="excluir(${endereco.id})" class="btn btn-danger" class="item"
											data-toggle="tooltip" data-placement="top"
											title="Apagar Endereço">
											<i class="fas fa-trash-alt"></i>
										</button>
									</td>
									
								</tr>
							</tbody>
						</table>
					</div>

					</section>
				</div>
			</div>
			</c:forEach>
			
			
			
		</div>
	</div>

	<script>
    function excluir(id) {
			swal({
			  title: "Você tem certeza?",
			  text: "Uma vez deletado, você não poderá recuperar esta endereço",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {  
				window.location = "deleteEnderecoCliente?id="+id;
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
			window.location = "editarEnderecoCliente?id="+id;
		  }
	
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



</body>
</html>