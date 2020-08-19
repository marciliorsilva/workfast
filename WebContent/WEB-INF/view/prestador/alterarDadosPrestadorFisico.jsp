<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-BR">

<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
								<h1 class="title-4">Minha Conta</h1>

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
				<div class="row" style="padding-bottom: 50%;">
					<div class="col-lg-12 col-md-12 col-sm-12 ">
						<div class="card">
							<form action="alterarDadosPessoais" method="post">
								<div class="card-body">
                                   
                                   <input type="hidden" name="id" value="${dadosPessoais.idDadosPessoais}">
                                   <input type="hidden" name="usuario" value="${usuarioLogado.idUsuario}">
									<div class="form-group">
										<b><label for="nome" class="control-label mb-1">Nome</label></b>
										<input id="nome" name="nome" type="text" class="form-control"
											value="${usuarioLogado.nome }">
									</div>
									<br>
									<div class="row">
										
                                       <div class="col-6">
											<b><label for="dtNascimento" class="control-label mb-1">
													Data de Nascimento</label></b> <input id="dataNascimento" name="dataNascimento" type="text" class="form-control"
											value="<fmt:formatDate
															value="${dadosPessoais.dataNascimento}" type="both"
															pattern="dd/MM/yyyy" dateStyle="full" />">


										</div>
										<div class="col-6">
											<b><label for="sexo" class="control-label mb-1">
													Sexo</label></b> <select id="sexo" name="sexo" class="form-control">
												<option value="">Selecione o seu sexo</option>
												<option value="1">Masculino</option>
												<option value="2">Feminino</option>
											</select>


										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-6">
											<div class="form-group">
												<b><label for="cpfCnpj" class="control-label mb-1">CPF</label></b>

												<input id="cpf" name="cpfCnpj" type="text"
													class="form-control" value="${dadosPessoais.cpfCnpj}">

											</div>
										</div>
										<div class="col-6">
											<b><label for="rgIe" class="control-label mb-1">
													RG </label></b> <input id="rg" name="rgIe" type="text"
												class="form-control" value="${dadosPessoais.rgIe}">

										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-6">
											<div class="form-group">
												<b><label for="telefone" class="control-label mb-1">Telefone</label></b>

												<input id="telefone" name="telefone" type="text"
													class="form-control" value="${dadosPessoais.telefone}">

											</div>
										</div>
										<div class="col-6">
											<b><label for="celular" class="control-label mb-1">
													Celular</label></b> <input id="celular" name="celular" type="text"
												class="form-control" value="${dadosPessoais.celular}">

										</div>
									</div>
									<br>
									<div class="form-group">
										<b><label for="email" class="control-label mb-1">Email</label></b>
										<input id="email" name="email" type="text"
													class="form-control" value="${usuarioLogado.email}">
									</div>
									<hr>

									
								</div>
								<div class="card-footer" style="height: 55px;">
									<div style="margin: 0 auto; float: right;">
										<button type="submit" class="btn btn-primary btn-sm">
											<i class="fa fa-dot-circle-o"></i>Alterar
										</button>
									</div>

								</div>
							</form>
						</div>
						
						<div class="card">
							<form action="alterarDadosEndereco" method="post">
								<div class="card-body">
                                   
                                   <input type="hidden" name="id" value="${endereco.id}">
                                    <input type="hidden" name="usuario" value="${usuarioLogado.idUsuario}">

									<div class="row">
										<div class="col-8">
											<div class="form-group">
												<b><label for="endereco" class="control-label mb-1">Endereco</label></b>

												<input id="endereco" name="logradouro" type="text"
													class="form-control" value="${endereco.rua}">
											</div>
										</div>
										<div class="col-4">
											<b><label for="numero" class="control-label mb-1">
													Numero</label></b> <input id="numero" name="numero" type="text"
												class="form-control" value="${endereco.numeroCasa}">
										</div>

									</div>
									<br>
									<div class="row">
										<div class="col-4">
											<div class="form-group">
												<b><label for="cidade" class="control-label mb-1">Cidade</label></b>

												<input id="cidade" name="cidade" type="text"
													class="form-control" value="${endereco.cidade.nome}">
											</div>
										</div>
										<div class="col-4">
											<b><label for="bairro" class="control-label mb-1">
													Bairro </label></b> <input id="bairro" name="bairro" type="text"
												class="form-control" value="${endereco.bairro}">
										</div>
										<div class="col-4">
											<b><label for="cep" class="control-label mb-1">
													CEP</label></b> <input id="cep" name="cep" type="text"
												class="form-control" value="${endereco.cep}">
										</div>
									</div>
									
									<div class="col-4">
											<b><label for="cep" class="control-label mb-1">
													Complemento</label></b> <input  name="complemento" type="text"
												class="form-control" value="${endereco.complemento}">
										</div>
									<br>
									<div class="col-6">
										<b><label for="estado" class="control-label mb-1">Estado</label></b>
										<select class="form-control" id="estado" name="estado">
											<option value="">Selecione</option>
											<option value="AC">Acre</option>
											<option value="AL">Alagoas</option>
											<option value="AP">Amapá</option>
											<option value="AM">Amazonas</option>
											<option value="BA">Bahia</option>
											<option value="CE">Ceará</option>
											<option value="DF">Distrito Federal</option>
											<option value="ES">Espirito Santo</option>
											<option value="GO">Goiás</option>
											<option value="MA">Maranhão</option>
											<option value="MS">Mato Grosso do Sul</option>
											<option value="MT">Mato Grosso</option>
											<option value="MG">Minas Gerais</option>
											<option value="PA">Pará</option>
											<option value="PB">Paraíba</option>
											<option value="PR">Paraná</option>
											<option value="PE">Pernambuco</option>
											<option value="PI">Piauí</option>
											<option value="RJ">Rio de Janeiro</option>
											<option value="RN">Rio Grande do Norte</option>
											<option value="RS">Rio Grande do Sul</option>
											<option value="RO">Rondônia</option>
											<option value="RR">Roraima</option>
											<option value="SC">Santa Catarina</option>
											<option value="SP">São Paulo</option>
											<option value="SE">Sergipe</option>
											<option value="TO">Tocantins</option>
										</select>


									</div>

									<div></div>

								</div>
								<div class="card-footer" style="height: 55px;">
									<div style="margin: 0 auto; float: right;">
										<button type="submit" class="btn btn-primary btn-sm">
											<i class="fa fa-dot-circle-o"></i>Alterar
										</button>
									</div>

								</div>
							</form>
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

	<script type="text/javascript">
		$(document).ready(function() {
			$('#estado').val("${endereco.estado}");
			$('#sexo').val("${dadosPessoais.sexo}")
			
			var $campoCpf = $("#cpf");
			$campoCpf.mask('000.000.000-00', {
				reverse : true
			});

			var $campoRg = $("#rg");
			$campoRg.mask('0.000.000', {
				reverse : true
			});

			var $campoData = $("#dtNascimento");
			$campoData.mask('00/00/0000', {
				reverse : true
			});

			var $campoDataM = $("#celular");
			$campoDataM.mask('(00) 00000-0000', {
				reverse : true
			});

			var $campoTelefone = $("#telefone");
			$campoTelefone.mask('(00) 0000-0000', {
				reverse : true
			});

			var $campoCep = $("#cep");
			$campoCep.mask('00.000-000', {
				reverse : true
			});

		});
	</script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							function limpa_formulário_cep() {
								// Limpa valores do formulário de cep.
								$("#endereco").val("");
								$("#bairro").val("");
								$("#cidade").val("");
								$("#uf").val("");

							}

							//Quando o campo cep perde o foco.
							$("#cep")
									.blur(
											function() {

												//Nova variável "cep" somente com dígitos.
												var cep = $(this).val()
														.replace(/\D/g, '');

												//Verifica se campo cep possui valor informado.
												if (cep != "") {

													//Expressão regular para validar o CEP.
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
																				$(
																						"#cidade")
																						.val(
																								dados.localidade);
																				$(
																						"#estado")
																						.val(
																								dados.uf);

																			} //end if.
																			else {
																				//CEP pesquisado não foi encontrado.
																				limpa_formulário_cep();
																				alert("CEP não encontrado.");
																			}
																		});
													} //end if.
													else {
														//cep é inválido.
														limpa_formulário_cep();
														alert("Formato de CEP inválido.");
													}
												} //end if.
												else {
													//cep sem valor, limpa formulário.
													limpa_formulário_cep();
												}
											});
						});
	</script>


</body>

</html>
<!-- end document-->