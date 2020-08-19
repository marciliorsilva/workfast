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

<style>
.swal-footer {
		background-color: rgb(245, 248, 250);
		margin-top: 32px;
		border-top: 1px solid #E9EEF1;
		overflow: hidden;
	}

	.swal-button {
		  border: 1px solid #3e549a;
		  text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
		}
</style>

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
										<label>Categoria</label> <select required="required"
											id="categoria" name="categoriaServico" class="form-control">
											<option value="">Selecione</option>
											<c:forEach items="${listaCategoria}" var="obj">

												<option value="${obj.idCategoriaServico}">${obj.nome}</option>


											</c:forEach>

										</select>
									</div>

									<div class="form-group">
										<label>Serviços</label> <select required="required"
											id="servicos" name="servicos" class="form-control">


										</select>
									</div>

									<div class="form-group ">
										<label for="descricao" class=" form-control-label">Digite
											uma breve descrição sobre o serviço escolhido! (255
											caracteres)</label>

										<textarea required="required" name="descricao" id="descricao"
											placeholder="Digite aqui..." class="form-control"></textarea>

									</div>



								</div>
						</div>




					</div>


				</div>
				<br>
				<br>
				<div class="container">

					<div class="row">

						<div class="col-lg-6 col-md-6">
							<div class="table-responsive table--no-card m-b-30"
								style="height: 250px;">
								<table
									class="table table-borderless table-striped table-earning">
									<thead>
										<tr>
											<th>${endereco.estado.nome}</th>
											<th></th>


										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listaCidades}" var="obj">

											<tr>
												<td id="${obj.idCidade }">${obj.nome}</td>
												<td class="text-right" style="background-color: #c1c1c1;"><label
													class="au-checkbox"> <input type="checkbox"
														name="check[]" class="checkCidades"
														value="${obj.idCidade }"> <span
														class="au-checkmark"></span>
												</label></td>
											</tr>



										</c:forEach>



									</tbody>
								</table>
							</div>
						</div>

						<div class="col-lg-6 col-md-6">
							<div class="table-responsive table--no-card m-b-30"
								style="height: 250px;">
								<table
									class="table table-borderless table-striped table-earning">
									<thead>
										<tr>
											<th>Area de atuação</th>



										</tr>
									</thead>
									<tbody id="tbAtuacao">

									</tbody>
								</table>
							</div>
						</div>


					</div>

				</div>





				<div class="form-group text-center">
					<button class="btn btn-primary" data-toggle="tooltip"
						data-placement="top" id="btnCadastrar" title="Salvar">Salvar</button>
				</div>
				
			</div>
		</div>
	</div>
	</div>
	</div>
	</section>

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
		var checados = [];
		var idUsuario = "${usuarioLogado.idUsuario}";

		var selectOption = document.getElementById("categoria");
		selectOption
				.addEventListener(
						'change',
						function() {
							$('#servicos').html("");
							var id = $(this).val();

							//encaminhando os valores do formulario para ser processadas 
							$
									.post(
											'filtrarServico',
											{
												idCategoria : id

											},
											function(dadosJSON) {
												var linhas = '';
												linhas += "<option value='' >Selecione </option>";

												$(dadosJSON)
														.each(
																function(i) {

																	linhas += "<option value='"+dadosJSON[i].idServico+"'>"
																			+ dadosJSON[i].nome
																			+ "</option>";

																});
												$('#servicos').html(linhas);

											});

							return false;// impedindo o encaminhamento

						});

		$(document).ready(function() {

			$(".checkCidades").click(function(e) {

				var html = "";
				checados = [];
				$.each($("input[name='check[]']:checked"), function() {

					checados.push($(this).val());

					var nome = $("#" + $(this).val()).text();
					html += '<tr><td>' + nome + '</td></tr>';

				});

				$("#tbAtuacao").html(html);

			});

			$.each($("input[name='check[]']"), function() {

				if ($(this).val() == "${endereco.cidade.idCidade}") {
                      $(this).click();
				}

			});

		});

		var btnCadastrar = document.getElementById("btnCadastrar");
		btnCadastrar.addEventListener('click', function() {

			var idServico = $("#servicos").val();

			var descricao = $("#descricao").val();
			// var array = checados.join(',');
			
            if(idServico == null || idServico == ""){
            	swal({
            		  title: "Selecione um serviço!",
            		  icon: "error",
            		  button: "Entendi",
            		});
      
            }else if(descricao == null || descricao == ""){
            	swal({
          		  title: "Informe uma descrição do serviço.",
          		  icon: "error",
          		  button: "Entendi",
          		});
            }else{
            	//encaminhando os valores do formulario para ser processadas 
    			$.post('saveServico', {
    				idServico : idServico,
    				idUsuario : idUsuario,
    				descricao : descricao,
    				idsCidades : JSON.stringify(checados)

    			}, function(dadosJSON) {
    				if(dadosJSON == true){
    					swal("Voce ja está vinculado(a) com esse serviço!");
    				}else{
    					swal("Serviço cadastrado!", "Clique no botão 'Ok' para continuar!", "success")
    					.then((value) => {
    						window.location = "ExibirServicos";
    					}); 	    			
    				}
    				
                   

    			});
	
            }
			
			return false;// impedindo o encaminhamento

		});
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
<!-- end document-->