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


<script type="text/javascript">
	$(document).ready(
			function() {

				function limpa_formul�rio_cep() {
					// Limpa valores do formul�rio de cep.
					$("#rua").val("");
					$("#bairro").val("");
					$("#cidade").val("");
					$("#uf").val("");
					$("#ibge").val("");
				}

				//Quando o campo cep perde o foco.
				$("#cep").blur(
						function() {

							//Nova vari�vel "cep" somente com d�gitos.
							var cep = $(this).val().replace(/\D/g, '');

							//Verifica se campo cep possui valor informado.
							if (cep != "") {

								//Express�o regular para validar o CEP.
								var validacep = /^[0-9]{8}$/;

								//Valida o formato do CEP.
								if (validacep.test(cep)) {

									//Preenche os campos com "..." enquanto consulta webservice.
									$("#rua").val("Carregando..");
									$("#bairro").val("Carregando...");
									$("#cidade").val("Carregando...");
									$("#uf").val("Carregando...");
									$("#ibge").val("Carregando...");

									//Consulta o webservice viacep.com.br/
									$.getJSON("https://viacep.com.br/ws/" + cep
											+ "/json/?callback=?", function(
											dados) {

										if (!("erro" in dados)) {
											//Atualiza os campos com os valores da consulta.
											$("#rua").val(dados.logradouro);
											$("#bairro").val(dados.bairro);
											$("#cidade").val(dados.localidade);
											$("#uf").val(dados.uf);
											$("#ibge").val(dados.ibge);
										} //end if.
										else {
											//CEP pesquisado n�o foi encontrado.
											limpa_formul�rio_cep();

											alert("CEP n�o encontrado.");
										}
									});
								} //end if.
								else {
									//cep � inv�lido.
									limpa_formul�rio_cep();
									alert("Formato de CEP inv�lido.");
								}
							} //end if.
							else {
								//cep sem valor, limpa formul�rio.
								limpa_formul�rio_cep();
							}
						});
			});
</script>

<!-- Main CSS-->
<link
	href="<%=request.getContextPath()%>/resources/css/theme-cliente.css"
	rel="stylesheet" media="all">




</head>


<body class="animsition">

	<c:import url="../cliente/menu.jsp" />

	<div class="main-content main-content--pb30">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="fontawesome-list-wrap">
					<!-- Conte�do do container -->
					<section>
					<h2 style="text-align: center;">Alterar Endere�o</h2>
					<br>

					<c:if test="${not empty mensagem}">
						<br>
						<div class="alert alert-success alert-dismissible">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							${mensagem}
						</div>
						<br>
					</c:if> <br>

					<form action="atulizarEndereco" method="post">

						<input type="hidden" name="id" value="${endereco.id}"> <input
							type="hidden" value="${usuarioLogado.idUsuario}" name="usuario">

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="select" class="form-control-label">Cep:</label>
							</div>
							<div class="col-12 col-md-5">
								<input type="text" required="" value="${endereco.cep}"
									maxlength="8" name="cep" id="cep" class="form-control">
							</div>
						</div>

						<!-- estado -->
						<div class="row form-group">
							<div class="col col-md-3">
								<label for="select" class=" form-control-label">Estado:</label>
							</div>
							<div class="col-12 col-md-5">
								<select required="required" id="estado" name="estado"
									class="form-control">
									<option value="">Selecione um estado</option>
									<c:forEach items="${listaEstado}" var="obj">

										<option id="${obj.uf}" value="${obj.idEstado}">${obj.nome}</option>
									</c:forEach>

								</select>
							</div>
						</div>

						<!-- Filtro de Cidade -->
						<div class="row form-group">
							<div class="col col-md-3">
								<label for="select" class=" form-control-label">Cidade:</label>
							</div>
							<div class="col-12 col-md-5">
								
								<select name="cidade" id="cidade" class="form-control">
								</select>
							</div>
						</div>

						<!-- Campo de estado -->
						<div class="row form-group">
							<div class="col col-md-3">
								<label for="select" class=" form-control-label">Rua:</label>
							</div>
							<div class="col-12 col-md-5">
								<input type="text" name="rua" value="${endereco.rua}" id="rua"
									required="" maxlength="45" class="form-control">
							</div>
						</div>


						<div class="row form-group">
							<div class="col col-md-3">
								<label for="select" class=" form-control-label">Bairro:</label>
							</div>
							<div class="col-12 col-md-5">
								<input type="text" name="bairro" value="${endereco.bairro}"
									required="" maxlength="45" id="bairro" class="form-control">
							</div>
						</div>

					


						<div class="row form-group">
							<div class="col col-md-3">
								<label for="select" class=" form-control-label">N�mero
									da Casa:</label>
							</div>
							<div class="col-12 col-md-5">
								<input type="text" name="numeroCasa"
									value="${endereco.numeroCasa}" required="" maxlength="6"
									class="form-control">
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="select" class=" form-control-label">Complemento:</label>
							</div>
							<div class="col-12 col-md-5">
								<input type="text" name="complemento"
									value="${endereco.complemento}" required="" maxlength="45"
									class="form-control">
							</div>
						</div>
						<!-- Fim do Filtro de profiss�o-->
						<div class="row form-group" style="float: right;">
							<div class="col col-md-3">
								<button type="submit" class="btn btn-primary">Alterar</button>
							</div>
						</div>
						<br>
						<br>
					</form>
				</div>
			</div>

			</section>
			<br> <br>
		</div>
	</div>
	</div>
	</div>



<script>

var selectOption = document.getElementById("estado");
selectOption.addEventListener('change', function(){
	$('#cidade').html("");
   var id = $(this).val();
  
   //encaminhando os valores do formulario para ser processadas 
     $.post('filtrarCidade', {
        idEstado:id
        
      }, function(dadosJSON){
    	  var linhas = '';
    	  linhas += "<option value='' >Selecione </option>";
			

			$(dadosJSON).each(function (i) {
			
				linhas += "<option value='"+dadosJSON[i].idCidade+"'>"+dadosJSON[i].nome+"</option>";
			
			});
			$('#cidade').html(linhas);
            
      });

   
    
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


<script type="text/javascript">
$(document).ready(
		function() {

			function limpa_formul�rio_cep() {
				// Limpa valores do formul�rio de cep.
				$("#endereco").val("");
				$("#bairro").val("");
				$("#cidade").val("");
				$("#uf").val("");

			}

			//Quando o campo cep perde o foco.
			$("#cep")
					.blur(
							function() {

								//Nova vari�vel "cep" somente com d�gitos.
								var cep = $(this).val()
										.replace(/\D/g, '');
								

								//Verifica se campo cep possui valor informado.
								if (cep != "") {

									//Express�o regular para validar o CEP.
									var validacep = /^[0-9]{8}$/;

									//Valida o formato do CEP.
									if (validacep.test(cep)) {

										//Preenche os campos com "..." enquanto consulta webservice.
										$("#endereco").val(
												"...");
										$("#bairro").val("...");
										$("#cidade").val("...");
										$("#estado").val("...");

										//Consulta o webservice viacep.com.br/
										$
												.getJSON(
														"https://viacep.com.br/ws/"
																+ cep
																+ "/json/?callback=?",
														function(
																dados) {

															if (!("erro" in dados)) {
																//Atualiza os campos com os valores da consulta.
																$(
																		"#endereco")
																		.val(
																				dados.logradouro);
																$(
																		"#bairro")
																		.val(
																				dados.bairro);
																var est = document.getElementById(""+dados.uf+"").innerHTML; 
																var id = document.getElementById(""+dados.uf+"").value;
																
																$(
																"#estado")
																.val($('option:contains('+est+')').val()
																		);
																
																$.post('filtrarCidade', {
														            idEstado:id
														            
														          }, function(dadosJSON){
														        	  var linhas = '';
														        	  linhas += "<option value='' >Selecione </option>";
																		

																		$(dadosJSON).each(function (i) {
																		
																			linhas += "<option value='"+dadosJSON[i].idCidade+"'>"+dadosJSON[i].nome+"</option>";
																		
																		});
																		$('#cidade').html(linhas);
																		$("#cidade")
																		.val($('option:contains('+dados.localidade+')').val()
																				);
														                
														          });

															} //end if.
															else {
																//CEP pesquisado n�o foi encontrado.
																limpa_formul�rio_cep();
																alert("CEP n�o encontrado.");
															}
														});
									} //end if.
									else {
										//cep � inv�lido.
										limpa_formul�rio_cep();
										alert("Formato de CEP inv�lido.");
									}
								} //end if.
								else {
									//cep sem valor, limpa formul�rio.
									limpa_formul�rio_cep();
								}
							});
		});
</script>
</body>
</html>