<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<!-- Importando a biblioteca Taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon"  href="<%=request.getContextPath()%>/resources/img/icon/fivicon.png">
<title>WorkFast</title>

<!-- Boostrap via CDN -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<!-- Fonte Google -->
<link href="https://fonts.googleapis.com/css?family=PT+Serif"
	rel="stylesheet">

<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Jquery Mask -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>

<!-- Jquery validate -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/localization/messages_pt_BR.js"></script>


<!-- Código JavaScript desta Página(Página de cadastro) -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/cliente/cadastroClienteFisico.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Código css desta Página(Página de cadastro) -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/cadastro.css" />
<script type="text/javascript">

$(document).ready(function(){
	$("#form_cadastroCliente").submit(function() {
	     
		 if($("input[required='required']").val() != "" && $("select[required='required']").val() != "" ){
	          
			   var area = "";  
			   var celular = $("#celular").val();
	           var cpfCnpj= $("#cpfCnpj").val();
	           var dataNascimento= $("#dataNascimento").val();
	           var nomeFantasia= "";
	           var razaoSocial= "";
	           var rgIe= $("#rgIe").val();
	           var sexo= $("#sexo").val();
	           var telefone= $("#telefone").val();
	           var idUsuario= "${usuarioLogado.idUsuario}";
	           var tipoUsuario= "${usuarioLogado.tipo_usuario}";
	           var bairro= $("#bairro").val();
	           var cep= $("#cep").val();
	           var idCidade= $("#cidade").val();
	           var complemento = $("#complemento").val();
	           var idEstado= $("#estado").val();
	           var numeroCasa= $("#numero").val();
	           var rua= $("#endereco").val();
	           
			 $.post('salvarDadosPrimeiroAcessoCliente',{
		           
				 idUsuario:idUsuario,
				 cpfCnpj:cpfCnpj,
				 dataNascimento:dataNascimento,
				 nomeFantasia:nomeFantasia,
		         razaoSocial:razaoSocial,
		         rgIe:rgIe,
		         sexo:sexo,
		         telefone:telefone,
		         celular:celular,
		         bairro:bairro,
		         cep:cep,
		         idCidade:idCidade,
		         complemento:complemento,
		         idEstado:idEstado,
		         numeroCasa:numeroCasa,
		         rua:rua,
		         area:area,
		         tipo:tipoUsuario,
		          
		          }, function(data){
		             
		        	  swal("Cadastro realizado com sucesso.","","success")
		        	  .then((value) => {
		        	    swal("Você será redirecionado para pagina inicial").then((value) => {
		        	    	 window.location = data;
		        	    });
		        	  });
		              
		             
		          });

			 
		 }
		return false;
	  });
});

</script>
</head>

<div class="page-wrapper">

	<div class="container">
		<div class="login-wrap">
			<div class="login-content" style="width: 600px; margin:0 auto; float: none;">

				<div class="login-logo">
					<a href="#"> <img
						src="<%=request.getContextPath()%>/resources/img/logo_workfast.png"
						class="img-responsive">

					</a>
				</div><br>
				
				<div style="margin-bottom: 20px;">
						<center>Olá ${usuarioLogado.nome}! Antes de ter acesso ao
							sistema informe algumas informações no formulario abaixo.</center>
				</div>

				<!-- Formulário de cadastro-->

				<div class="login-form">
					<form id="form_cadastroCliente" >
						<input type="hidden" value="${usuarioLogado.idUsuario}" name="usuario">
						<input type="hidden" value="" name="nomeFantasia">
						<input type="hidden" value="" name="razaoSocial">
							
                     <div class="row">
						<div class="col-md-6 col-lg-6" >
							<div class="form-group">
								<label for="cpf">CPF:</label> <input type="text"
									class="form-control" id="cpfCnpj" placeholder="Digite seu cpf"
									name="cpfCnpj">
							</div>
						</div>

						<div class="col-md-6 col-lg-6" >
							<div class="form-group">
								<label for="rg">RG:</label> <input type="text"
									class="form-control" id="rgIe" placeholder="Digite  seu RG"
									name="rgIe">
					        </div>
					    </div>
					</div>

					<div class="row">
						<div class="col-md-6 col-lg-6">
								<div class="form-group">
									<label for="data_nascimento">Data de Nascimento:</label> <input
										type="text" class="form-control" id="dataNascimento"
										placeholder="00/00/0000" required="required" name="dataNascimento">
								</div>
							</div>
						


						<div  class="col-md-6 col-lg-6">
							<div class="form-group">
								<label for="sexo">Sexo:</label> <select
									id="sexo" required="required" name="sexo" class="form-control">
									<option value="">Selecione</option>
									<option value="1">Masculino</option>
									<option value="2">Feminino</option>
								</select>
							</div>
						</div>
					</div>


                    <div class="row">
						<div class="col-md-6 col-lg-6" >
							<div class="form-group" >
								<label for="telefone">Número Telefone fixo :</label> <input
									type="text" class="form-control" id="telefone"
									placeholder="(00) 0000-0000" name="telefone">
							</div>
						</div>

						<div class="col-md-6 col-lg-6">
							<div class="form-group" >
								<label for="celular">Número Celular :</label> <input type="text"
									class="form-control" id="celular" required="required"
									placeholder="(00) 9 0000-0000" name="celular">
							</div>
						</div>
					</div>
					
					<div class="row">	
						<div class="col-md-12 col-lg-12">
							<div class="form-group" >
								<label>Cep</label> <input id="cep" required="required"
									class="form-control" type="text" name="cep"
									placeholder="Digite seu CEP">
							</div>
						</div>
					</div>
						
					<div class="row">
						<div class="col-md-6 col-lg-6" >
							<div class="form-group">
								<label>Endereço</label> <input id="endereco" required="required"
											class="form-control" type="text" name="rua"
											placeholder="Digite seu endereco">
							</div>
						</div>
						
						<div class="col-md-6 col-lg-6" >
							<div class="form-group">
								<label>Bairro</label> <input id="bairro" required="required"
											class="form-control" type="text" name="bairro"
											placeholder="Digite seu bairro">
							</div>
						</div>
					</div>
						
					<div class="row">	
						<div class="col-md-6 col-lg-6" >
							<div class="form-group">
								<label>Estado</label> <select required="required" id="estado"
											name="estado" class="form-control">
											<option value="">Selecione</option>
											<c:forEach items="${listaEstado}" var="obj">
												<option id="${obj.uf}" value="${obj.idEstado}">${obj.nome}</option>
											</c:forEach>

										</select>
							</div>
						</div>
						
						<div class="col-md-6 col-lg-6" >
							<div class="form-group">
								<label>Cidade</label> <select required="required" id="cidade"
											class="form-control" name="cidade" class="form-control">
											

										</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-6" >
							<div class="form-group" >
								<label>Numero</label> <input id="numero" required="required"
											class="form-control" type="text" name="numeroCasa"
											placeholder="Digite o numero">
							</div>
						</div>
							
						<div class="col-md-6 col-lg-6">
							<div class="form-group" >
								<label>Complemento</label> <input id="complemento"
											class="form-control" type="text"
											name="complemento" placeholder="Digite seu complemento">
							</div>
						</div>
					</div>
						
                     <div class="row">
						<div class="col-md-12 col-lg-12"><br>
							<button style="width: 100%" type="submit" id="button_cadastrar"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-ok"></span> Cadastrar
							</button>
						</div>
					 </div>



					</form>

				</div>
			</div>
		</div>
	</div>
</div>


	<script type="text/javascript">	
 $(document).ready(function(){
	
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
																		//CEP pesquisado não foi encontrado.
																		limpa_formulário_cep();
																		 swal("Cep não encontrado!", "O cep informado não foi encontrado", "error");
																	}
																});
											} //end if.
											else {
												//cep é inválido.
												limpa_formulário_cep();
												
												swal("Formato Invalido!", "Formato do cep informado não é valido.", "error");
											}
										} //end if.
										else {
											//cep sem valor, limpa formulário.
											limpa_formulário_cep();
										}
									});
				

	 //------
	
 });
 
</script>




</body>
</html>