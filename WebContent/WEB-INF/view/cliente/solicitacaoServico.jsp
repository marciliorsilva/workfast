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

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Main CSS-->
<link
	href="<%=request.getContextPath()%>/resources/css/theme-cliente.css"
	rel="stylesheet" media="all">



<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	$(document).ready(
			function() {

				function limpa_formulário_cep() {
					// Limpa valores do formulário de cep.
					$("#rua").val("");
					$("#bairro").val("");
					$("#cidade").val("");
					$("#uf").val("");
					$("#ibge").val("");
				}

				//Quando o campo cep perde o foco.
				$("#cep").blur(
						function() {

							//Nova variável "cep" somente com dígitos.
							var cep = $(this).val().replace(/\D/g, '');

							//Verifica se campo cep possui valor informado.
							if (cep != "") {

								//Expressão regular para validar o CEP.
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
</style>
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
							<li class="active"></span>Endereço</li>
							<li>Informações</li>
							<li>Contrato</li>
							<li>Efetuando</li>
							<li>Finalizado</li>
						</ul>

					</section>

					<section id="solicitacao">
					    <h2 style="text-align: center;">
					    <c:if test="${usuarioServico.usuario.tipo_usuario == '1'}">
					        ${usuarioServico.usuario.nome} -
					    </c:if>
					    
					    <c:if test="${usuarioServico.usuario.tipo_usuario == '2'}">
					        ${dados.nomeFantasia} -
					    </c:if>
						${usuarioServico.servico.nome} 
					    
					     </h2>
						<h2 style="text-align: center;">Endereço</h2>
						<br>
						<p>Você irá escolher um dos seus endereço cadastrados para que o Prestador saiba onde que você reside. Apos disso, você ficará no aguardo da confirmação do Prestador. Caso o prestador aceite a sua solicitação, irá 
							prosseguir para a segunda etapa do processo de solicitação: <b>Informações</b>.</p>
						<br>
						<div class="table-responsive">
						<table class="table table-striped table-condensed">
						<thead>
							<tr>
							    <th>Estado</th>
								<th>Cidade</th>
								<th>Endereço</th>
								<th>Numero</th>
								<th>CEP</th>
								<th></th>
								
							</tr>
						</thead>
						<tbody>
						   <c:forEach items="${listaEndereco}" var="obj">
						   <tr>
								<td>${obj.estado.nome}</td>
								<td>${obj.cidade.nome}</td>
								<td>${obj.rua}</td>
								<td>${obj.numeroCasa}</td>
								<td>${obj.cep}</td>
								<td><button type="button" id="solicitar" class="btn btn-primary" onclick="solicitarPedido(${obj.id})" data-whatever="${obj.cidade.nome} - ${obj.rua} - ${obj.numeroCasa}"  >Solicitar</button></td>
							</tr>
				
																
				
				
						  </c:forEach>
							
							
						</tbody>
					</table>
					</div>

						
						<br> <br> <br>


						
					</section>
					<br> <br>
				</div>
			</div>
		</div>
	</div>
	
 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Enviar Proposta</h5>
        <button type="button" onclick="limparCampo();" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" id="endereco" class="col-form-label1"></label>
            
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Mensagem:</label>
            <textarea class="form-control" id="mensagem"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary"  data-dismiss="modal">Fechar</button>
        <button type="button" id ="enviarPedido" class="btn btn-primary">Enviar</button>
      </div>
    </div>
  </div>
</div>

	

	
	
	
	<script type="text/javascript">
	
	
	 var idUsuario = "${usuarioLogado.idUsuario}";
	 var idUsuarioServico = "${idUsuarioServico}";
	 var idEndereco = "";
	 
     function solicitarPedido(id){
    	 
    	 
    	 $.post('pedidoSolicitado', {
				idUsuario : idUsuario,
				idUsuarioServico : idUsuarioServico,
				idEndereco : id,
				

			}, function(dadosJSON) {

				if(dadosJSON == "notExist"){
					idEndereco = id;
					$('#endereco').html($('#solicitar').data('whatever'))
					$('#exampleModal').modal('show');
					
				    	
					
				}else{
					
					 swal("Você já solicitou esse serviço para o endereço escolhido.","Consulte no menu ['Meus Pedidos']","warning");
				}
			});
		
		
	 }
     
    	 
	 function limparCampo(){
		 $('#mensagem').val(" ");
	 }
	 
	 $("#enviarPedido").click(function() {
		
     var mensagem = $('#mensagem').val();
		 
		 if($('#mensagem').val() == null || $('#mensagem').val() == ""){
		     
			 swal("Digite a mensagem para ser enviada.","","warning");
		 }else{
			 
			//encaminhando os valores do formulario para ser processadas 
				$.post('enviarSolicitacaoContrato', {
					idUsuario : idUsuario,
					idUsuarioServico : idUsuarioServico,
					idEndereco : idEndereco,
					mensagem:mensagem,

				}, function(dadosJSON) {

					if(dadosJSON == "sent"){
						
						 
						 swal("Solicitação enviada com sucesso.","","success");
						 limparCampo();
						 $('#exampleModal').modal('hide');
						 $('#solicitacao').html("<center>Solicitação enviada com sucesso!</br>Aguardando aprovação do </center>");
					
					}
				});
			 
			 
		 }
		 
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