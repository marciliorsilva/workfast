<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon"  href="<%=request.getContextPath()%>/resources/img/icon/fivicon.png">

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


<!-- Main CSS-->
<link
	href="<%=request.getContextPath()%>/resources/css/theme-cliente.css"
	rel="stylesheet" media="all">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



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


/* Star */

@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

fieldset, label { margin: 0; padding: 0; }
body{ margin: 20px; }
h1 { font-size: 1.5em; margin: 10px; }

/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: left;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  }
</style>

<script>
$(document).ready(function(){
	
	//$("#cadastrar_avaliacao").submit(function() {
		$("#button").click(function(){
			
	  		  
			   var mensagem = $("#mensagem").val();  
			   var idSolicitacao = $("#id_solicitacao").val();
			   var estrela = $("input[name='rating']:checked").val();
			   
  	
			 $.post('adicionarAvaliacao',{
		           
				 mensagem:mensagem,
				 idSolicitacao:idSolicitacao,
				 estrela:estrela,
		          
		          }, function(data){    
		        	  swal("Avalicação enviada com sucesso.","","success"); 
		        	  $("#div_avaliacao").hide(); 
		          });

		return false; 
	  });
});
</script>
</head>

<body class="animsition">

	<c:import url="../cliente/menu.jsp" />

	<!-- Container de conteúdo-->
	<div class="main-content main-content--pb30">
		<div class="section__content section__content--p30">
			<div class="container-fluid">

				<div class="fontawesome-list-wrap">
					<section>
						<h3 style="text-align: center;">Progresso do pedido</h3>
						<br>
						<ul id="progress">
							<li></span>Endereço</li>
							<li>Informações</li>
							<li>Contrato</li>
							<li>Efetuando</li>
							<li class="active">Finalizado</li>
						</ul>

					</section>

					<section>
						<h2 style="text-align: center;">Pedido Finalizado</h2>
						<br>

						<p>Este é o último estágio do pedido, aqui você poderá avaliar
							o prestador de serviço que prestou serviço para você. Você poderá
							dar uma nota ao mesmo e também deixar um comentário para
							ele(Outras pessoas poderam vê este comentário, então evite
							qualquer tipo de palavras ofensivas.) informando como foi que ele
							prestou o serviço(Se ele fez o serviço como era previsto, se ele
							atrasou etc...).</p>
						<br>

						<h3 style="text-align: center;">Informações do Prestador de
							serviço</h3>
						<br>

						<div class="row form-group">
							<div class="col col-md-2">
								<label for="select" class=" form-control-label"
									style="font-weight: bold;">Foto:</label>
							</div>
							<div class="col-12 col-md-5">
								<p>
									<img src="<%=request.getContextPath()%>/resources/img/icon_cliente/icone_mecanico.png"
										style="height: 70px; width: 150px;" />
								</p>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-2">
								<label for="select" class=" form-control-label"
									style="font-weight: bold;">Nome:</label>
							</div>
							<div class="col-12 col-md-5">
								<p>Pedro Silva</p>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-2">
								<label for="select" class=" form-control-label"
									style="font-weight: bold;">Profissão:</label>
							</div>
							<div class="col-12 col-md-5">
								<p>Eletricista</p>
							</div>
						</div>
						<br>

						<h3 style="text-align: center;">Avaliação</h3>
						<br>

						<div id="div_avaliacao">
						<div class="row form-group">
							<div class="col col-md-3">
								<label for="select" class=" form-control-label"
									style="font-weight: bold;">Recomendação:</label>
							</div>
							
							
							<div class="col-12 col-md-5">
							<form  id="cadastrar_avaliacao">
								<fieldset class="rating">
									<input type="radio" id="star5" name="rating" value="5" /><label
										class="full" for="star5" title="5 Estrelas"></label> <input
										type="radio" id="star4half" name="rating" value="4.5" /><label
										class="half" for="star4half" title="4.5 Estrelas"></label> <input
										type="radio" id="star4" name="rating" value="4" /><label
										class="full" for="star4" title=" 4 Estrelas"></label> <input
										type="radio" id="star3half" name="rating" value="3.5" /><label
										class="half" for="star3half" title=" 3.5 Estrelas"></label> <input
										type="radio" id="star3" name="rating" value="3" /><label
										class="full" for="star3" title=" 3 Estrelas"></label> <input
										type="radio" id="star2half" name="rating" value="2.5" /><label
										class="half" for="star2half" title="2.5 Estrelas"></label> <input
										type="radio" id="star2" name="rating" value="2" /><label
										class="full" for="star2" title=" 2 Estrelas"></label> <input
										type="radio" id="star1half" name="rating" value="1.5" /><label
										class="half" for="star1half" title=" 1.5 Estrelas"></label> <input
										type="radio" id="star1" name="rating" value="1" /><label
										class="full" for="star1" title="1 Estrela"></label> <input
										type="radio" id="starhalf" name="rating" value="0.5" /><label
										class="half" for="starhalf" title="0.5 Estrelas"></label>
								</fieldset>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="select" class=" form-control-label"
									style="font-weight: bold;">Escreva um comentário:</label>
							</div>
							<div class="col-12 col-md-5">
								<textarea class="form-control" id="mensagem" required rows="7" style="resize: none"></textarea>	
							</div>
						</div>
						<input type="hidden" value="17" id="id_solicitacao">
						
						<div class="row form-group" style="float: right;">
							<div class="col col-md-3">
								<button type="button" id="button" class="btn btn-primary">&nbsp;
									Enviar avaliação</button>
							</div>
						</div>
						
						
					</form>
				</div>
					</section>
					<br>
					<br>
				</div>
				<br>
				<br>
			</div>
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