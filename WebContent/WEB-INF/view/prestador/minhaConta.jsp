<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-BR">

<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
					
					 <c:if test="${not empty mensagemFoto}">
							<br><div class="alert alert-success alert-dismissible">
									<button type="button" class="close" data-dismiss="alert">&times;</button>
									${mensagemFoto}
							</div><br>
					</c:if>
					
                  <form action="alteraImagemPrestador" method="post" enctype="multipart/form-data">
	                                <div class="row form-group">
	                                    <img src="<%=request.getContextPath()%>/resources/img/${usuarioLogado.foto}" class="img-responsive img-thumbnail" alt="foto" style="width: 150px; height: 144px; margin-left: 20px; ">   
	                                    <input type="file" class="btn btn-default" id="foto" name="file" required>
	                                    <input type="hidden" name="idUsuario" id="id_usuario" value="${usuarioLogado.idUsuario}" required>
	                                </div>
	                           
	                                 <div class="row form-group" >    
	                                 	<div class="col col-md-3">        
	                                 	<button type="submit" class="btn btn-primary" > &nbsp;
	                                 		<i class="fas fa-upload"></i> Enviar foto</button>    
	                                 	</div> 
	                                 </div>     
	 				</form>
	 				
						<div class="card">
						${msg}
						<form action="editarDadosPrestadorFisico?IdUsuario=${usuarioLogado.idUsuario}" method="post">
														
							<div class="card-body">
								
									<div class="form-group">
										<b><label for="nome" class="control-label mb-1">Nome</label></b>
										<p>
											<label>${usuarioLogado.nome}</label>
										</p>
									</div>
									<br>
									<div class="row">
										<div class="col-6">
											<div class="form-group">

												<b><label for="dtNascimento" class="control-label mb-1">Data
														de Nascimento</label></b>
												<p>
													<label><fmt:formatDate
															value="${dadosPessoais.dataNascimento}" type="both"
															pattern="dd/MM/yyyy" dateStyle="full" /></label>
												</p>
											</div>
										</div>

										<div class="col-6">
											<b><label for="sexo" class="control-label mb-1">
													Sexo</label></b>
											<c:choose>
												<c:when test="${dadosPessoais.sexo == '1'}">

													<p>
														<label>Masculino</label>
													</p>
												</c:when>
												<c:otherwise>

													<p>
														<label>Feminino</label>
													</p>
												</c:otherwise>
											</c:choose>

										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-6">
											<div class="form-group">
												<b><label for="cpfCnpj" class="control-label mb-1">CPF</label></b>
												<p>
													<label>${dadosPessoais.cpfCnpj}</label>
												</p>
											</div>
										</div>
										<div class="col-6">
											<b><label for="rgIe" class="control-label mb-1">
													RG </label></b>
											<p>
												<label>${dadosPessoais.rgIe}</label>
											</p>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-6">
											<div class="form-group">
												<b><label for="telefone" class="control-label mb-1">Telefone</label></b>
												<p>
													<label>${dadosPessoais.telefone}</label>
												</p>
											</div>
										</div>
										<div class="col-6">
											<b><label for="celular" class="control-label mb-1">
													Celular</label></b>
											<p>
												<label>${dadosPessoais.celular}</label>
											</p>
										</div>
									</div>
									<br>
									<div class="form-group">
										<b><label for="email" class="control-label mb-1">Email</label></b>
										<p>
											<label>${usuarioLogado.email}</label>
										</p>
									</div>
									<hr>

									<div class="row">
										<div class="col-8">
											<div class="form-group">
												<b><label for="endereco" class="control-label mb-1">Endereco</label></b>

												<p>
													<label> ${endereco.rua} </label>
												</p>
											</div>
										</div>
										<div class="col-4">
											<b><label for="numero" class="control-label mb-1">
													Numero</label></b>

											<p>
												<label>${endereco.numeroCasa}</label>
											</p>
										</div>

									</div>
									<br>
									<div class="row">
										<div class="col-4">
											<div class="form-group">
												<b><label for="cidade" class="control-label mb-1">Cidade</label></b>

												<p>
													<label>${endereco.cidade.nome}</label>
												</p>
											</div>
										</div>
										<div class="col-4">
											<b><label for="bairro" class="control-label mb-1">
													Bairro </label></b>

											<p>
												<label>${endereco.bairro}</label>
											</p>
										</div>
										<div class="col-4">
											<b><label for="cep" class="control-label mb-1">
													CEP</label></b>

											<p>
												<label>${endereco.cep}</label>
											</p>
										</div>
									</div>
									<br>
									<div class="col-6">
										<b><label for="estado" class="control-label mb-1">Estado</label></b>

										<p>
											<label>${endereco.estado.uf}</label>
										</p>

									</div>
									
									<div class="col-6">
										<b><label for="estado" class="control-label mb-1">Complemento</label></b>

										<p>
											<label>${endereco.complemento}</label>
										</p>

									</div>

									<div></div>
								
							</div>
							<div class="card-footer" style="height: 55px;">
								 <div style="margin: 0 auto; float: right;">
								   <button  type="submit" class="btn btn-primary btn-sm">
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

</body>

</html>
<!-- end document-->