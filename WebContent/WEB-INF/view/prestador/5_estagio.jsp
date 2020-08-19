<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-BR">

<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Required meta tags-->

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<style type="text/css">
* {
	box-sizing: border-box;
}

#progress {
	padding: 0;
	list-style-type: none;
	font-family: arial;
	font-size: 12px;
	clear: both;
	line-height: 1em;
	margin: 0 -1px;
	text-align: center;
}

#progress li {
	font-size: 1.4em;
	float: left;
	padding: 10px 30px 10px 40px;
	background: #333;
	color: #fff;
	position: relative;
	border-top: 1px solid #666;
	border-bottom: 1px solid #666;
	width: 19%;
	margin: 0 1px;
	margin-bottom: 50px;
}

#progress li:before {
	content: '';
	border-left: 16px solid #fff;
	border-top: 16px solid transparent;
	border-bottom: 16px solid transparent;
	position: absolute;
	top: 0;
	left: 0;
}

#progress li:after {
	content: '';
	border-left: 16px solid #333;
	border-top: 16px solid transparent;
	border-bottom: 16px solid transparent;
	position: absolute;
	top: 0;
	left: 100%;
	z-index: 20;
}

#progress li.active {
	font-weight: bold;
	background: #23468c;
}

#progress li.active:after {
	border-left-color: #23468c;
}

/*Mapa*/
#mapa {
	width: 100%;
	height: 400px;
	float: left
}

#trajeto-texto {
	width: 100%;
	height: 400px;
	overflow: scroll
}
</style>


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


<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



</head>

<body class="animsition">

	<div class="page-wrapper">
		<!-- menu adm -->
		<c:import url="../prestador/menu.jsp" />
		<!-- Container de conteúdo-->
		<div class="main-content main-content--pb30">
			<div class="section__content section__content--p30">


				<!-- Conteiner de Filtro -->
				<div class="container-fluid">

					<!-- Conteiner de listagem de candidatos -->

					<div class="fontawesome-list-wrap">
						<section>
						<h3 style="text-align: center;">Progresso do pedido</h3>
						<br>
						<ul id="progress">
							<li></span>Inf. Cliente</li>
							<li>Inf. Serviço</li>
							<li>Contrato</li>
							<li>Efetuando</li>
							<li class="active">Finalizado</li>
						</ul>

						</section>

						<section>
						<h2 style="text-align: center;">Serviço finalizado</h2>
						<br>
						<p>Parabéns por concluir este serviço. O Cliente irá avaliar
							como você efetuou o serviço. Neste estágio você poderá ver o
							comentário que ele deixou sobre o serviço e que nota ele lhe deu.
						</p>
						<br>

						<h4 style="text-align: center;">Avaliação</h4>
						<br>
						<br>

						<p>O cliente x avaliou você desta maneira:</p>
						<br>
						<br>

						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star-half"></i>(Recomendado)<br>
						<!-- ${mensagem} -->
						<p>O prestador x prestou serviço pra mim no dia 00/00/000 e
							concluiu com êxato aquilo tinha prometido, super recomendo.</p>
							
							<div class="row form-group" style="float: right;">
							<div class="col col-md-3">

								<button type="button" id="finalizar" class="btn btn-primary">
									&nbsp;<i class="fas fa-forward"></i> Finalizar serviço
								</button>

							</div>
						</div>


						</section>
						<br> <br>
						
					</div>
				</div>
			</div>
		</div>
		</section>


	</div>

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

	</div>

	</div>
	<script type="text/javascript">
	
	$("#finalizar").on('click', function(){
		
		  $.post('finalizarContrato',{
				 cas:"${proposta}",
		          
		          }, function(data){    
		        	  swal("Serviço finalizado com sucesso!.","","success");
		        	  window.location = "ServicosFinalizados";
		          });
		
	})
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