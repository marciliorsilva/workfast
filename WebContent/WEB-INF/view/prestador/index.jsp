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


<!-- Main CSS-->
<link
	href="<%=request.getContextPath()%>/resources/css/theme-prestador.css"
	rel="stylesheet" media="all">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	

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
								<h1 class="title-4">
									Bem vindo <span>${usuarioLogado.nome}</span>
								</h1>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
		
		<section>
		<div class="section__content section__content--p30">
			
				
				<div class="container" style="padding-bottom: 50%;" style="background-color:white;" >
				  
				   <br>
				   <div id="propostas" >
				   
				   </div>
				  
				   
				   
				</div>
			
		</div>
		</section>

		<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="copyright">
						<p>
							Copyright © 2018 WorkFast. Todos os direitos reservados.
						</p>
					</div>
				</div>
			</div>
		</div>
		</section>

	</div>

	</div>
	<script type="text/javascript">
	
	var cas = "${usuarioLogado.idUsuario}";
	function listarSolicitacoes(){
		
		$('#propostas').html(' ').fadeOut(200);
		
		 $.post('buscarSolicitacoesDoPrestadorLogado', {
	          
			 cas:cas,
	          
	        	   
	       }, function(dadosJSON){
	    	  
	     	  var linhas = " ";
	     	    linhas += '<div class="row">';
					if(dadosJSON.length > 0){$(dadosJSON).each(function (i) {
						
						  linhas +='<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">';
                          linhas +=' <aside class="profile-nav alt">';
                              linhas +=' <section class="card">';
                                   linhas +='<div class="card-header user-header alt bg-dark">';
                                       linhas +='<div class="media">';
                                           linhas +='<a href="#">';
                                               linhas +='<img  class="align-self-center rounded-circle mr- " style=" width:85px; height:85px; margin-right:30px;" alt="" src="/workfast/resources/img/'+dadosJSON[i].foto+'">';
                                           linhas +='</a>';
                                           linhas +=' <div class="media-body">';
                                            if(dadosJSON[i].tipoUsuario == '1'){
												 linhas +='<h2 style="float:right;" class="text-light display-6">'+dadosJSON[i].nome+'</h2> '; 
											 }
											 
											 if(dadosJSON[i].tipoUsuario == '2'){
												 linhas +='<h2 style="float:right;" class="text-light display-6">'+dadosJSON[i].nomeFantasia+'</h2> ';
											 }
                                               linhas +='<p style="font-size:12px; color:#C1C1C1; float:right;">Proposta de Serviço</p>';
                                           linhas +='</div>';
                                       linhas +='</div>';
                                   linhas +='</div>';


                                   linhas +='<ul class="list-group list-group-flush">';
                                       linhas +='<li class="list-group-item">';
                                           linhas +='<a href="#" style="font-size:18px;">';
                                           linhas +='<i class="fas fa-gears"></i>  '+dadosJSON[i].servico;
                                        	   
                                           linhas +='</a>';
                                       linhas +='</li>';
                                       linhas +='<li class="list-group-item">';
                                     
	                                       linhas +='<b>Cidade:</b><br>'+dadosJSON[i].cidade;
	                                       linhas +='<br><b>Endereço:</b><br>'+dadosJSON[i].rua + ' - Nº '+dadosJSON[i].numeroCasa;
	                                       linhas +='<br><b>Mensagem:</b><br><textarea style="resize: none" class="form-control" rows="5" disabled>'+dadosJSON[i].mensagem+'</textarea>';
	                                       
	                                    	   
	                                       
                                        linhas +='</li>';
                                        linhas +='<li class="list-group-item">';
                                        linhas += '<div style="float:right;"><a href="PrimeiraEtapa?cas='+dadosJSON[i].idProposta+'"><button class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Contratar">Veja mais <i class="fa fa-handshake-o "></i></button></a></div>';
                                       linhas +='</li>';
                                       linhas +='</ul>';

                                       linhas +='</section>';
                                   linhas +='</aside>';
                               linhas +='</div>';

						
						
							
							
							
						       	
						       	  
							
						});
					linhas += '</div>';
					$('#propostas').html(linhas).fadeIn(1200);
						
					}else{
						$('#propostas').html('<br><br><center><span>Não tem solicitação</span></center>').fadeIn(1200);
					}

					
	             
	       });

	} 
	
	$(document).ready(function(){
		
		listarSolicitacoes(); 
		setInterval("listarSolicitacoes()", 60000);
		 
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