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

#mapa { width: 100%; height: 400px; float: left }
#trajeto-texto { width: 100%; height: 400px; overflow: scroll }
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
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
                                    <h3 style="text-align: center;">Progresso do pedido</h3><br>    
                                    <ul id="progress">
                                            <li ></span>Inf. Cliente</li>
                                            <li >Inf. Serviço</li>
                                            <li class="active">Contrato</li>
                                            <li>Efetuando</li>
                                            <li>Finalizado</li>
                                    </ul>
                                    
                                </section>

                            <section >
                               <h2 style="text-align: center;">Elabore um contrato</h2><br>
                                <p> Nesta etapa você precisará criar um contrato de serviço para o cliente, com todas as informações
                                necessárias para o trabalho. Este contrato será enviado ao cliente e o mesmo aceitará ou não este serviço através
                                do contrato que você elaborar aqui. <br> Obs.: O cliente poderá baixar este contrato via PDF 
                                 </p><br>

                                <h4 style="text-align: center;"> Contrato</h4><br><br>
                                
                                <div class="col-lg-12 col-md-12">
                                <div class="card">
                                    <div class="card-header" >
                                        <strong >Informações do Contrato</strong>
                                        
                                    </div>
                                    <div class="card-body card-block">
                                       
                                       <div class="row">
                                         <div class="col-md-3">
                                           <div class="form-group">
	                                            <label for="contrato" class=" form-control-label"><b>Nª Contrato</b></label>
	                                            <input type="text" disabled="disabled" id="numeroContrato" placeholder="" class="form-control">
                                          </div>
                           
                                         </div>
                                          <div class="col-md-9">
                                             <div class="form-group">
	                                            <label for="cliente" class=" form-control-label"><b>Cliente</b></label>
	                                               <c:if test="${proposta.tipoUsuario == '1'}">
	                                                 <input type="text" disabled="disabled" id="cliente" placeholder="" value=" ${proposta.nome} " class="form-control">
	                                              
												    </c:if>
												     <c:if test="${proposta.tipoUsuario == '2'}">
												     <input type="text" disabled="disabled" id="cliente" placeholder="" value="  ${proposta.nomeFantasia } " class="form-control">
	                                              
												      
												    </c:if>
	                                              
	                                            
	                                           
                                             </div>
                           
                                         </div>
                                       </div>
                                       
                                       <div class="row">
                                         <div class="col-md-4">
	                                           <div class="form-group">
		                                            <label for="estado" class=" form-control-label"><b>Estado</b></label>
		                                            <input type="text" id="estado" value="${proposta.estado}" disabled="disabled" class="form-control">
	                                          </div>
                           
                                         </div>
                                         <div class="col-md-4">
	                                           <div class="form-group">
		                                            <label for="cidade" class=" form-control-label"><b>Cidade</b></label>
		                                            <input type="text" disabled="disabled" value="${proposta.cidade }" id="cidade" placeholder="" class="form-control">
	                                          </div>
                           
                                         </div>
                                         <div class="col-md-4">
	                                           <div class="form-group">
		                                            <label for="cep" class=" form-control-label"><b>CEP</b></label>
		                                            <input type="text"  disabled="disabled" value="${proposta.cep }" id="cep" placeholder="" class="form-control">
	                                          </div>
                           
                                         </div>
                                          
                                       </div>
                                       
                                       <div class="row">
                                        <div class="col-md-6">
                                             <div class="form-group">
	                                            <label for="bairro" class=" form-control-label"><b>Bairro</b></label>
	                                            <input type="text" disabled="disabled" id="bairro" value="${proposta.bairro}" class="form-control">
                                             </div>
                           
                                         </div>
                                         <div class="col-md-6">
	                                           <div class="form-group">
		                                            <label for="endereco" class=" form-control-label"><b>Endereco</b></label>
		                                            <input type="text" disabled="disabled" id="endereco" value="${proposta.rua }" class="form-control">
	                                          </div>
                           
                                         </div>
                                         </div>
                                         <div class="row">
                                         <div class="col-md-6">
	                                           <div class="form-group">
		                                            <label for="numero" class=" form-control-label"><b>Numero</b></label>
		                                            <input type="text" disabled="disabled" value="${proposta.numeroCasa }" id="numero" placeholder="" class="form-control">
	                                          </div>
                           
                                         </div>
                                         <div class="col-md-6">
	                                           <div class="form-group">
		                                            <label for="complemento" class=" form-control-label"><b>Complemento</b></label>
		                                            <input type="text" disabled="disabled" value="${proposta.complemento }"id="complemento" placeholder="" class="form-control">
	                                          </div>
                           
                                         </div>
                                        
                                         
                                          
                                       </div>
                                        
                                         <hr>
                                       
                                       
                                       <div class="row">
                                         <div class="col-md-12">
	                                           <div class="form-group">
		                                            <label for="servico" class=" form-control-label"><b>Serviço</b></label>
		                                            <input type="text" id="servico" disabled="disabled"  value="${proposta.servico }" class="form-control">
	                                          </div>
                           
                                         </div>
                                       </div>
                                       
                                       <div class="row">
                                         <div class="col-md-12">
	                                            <div class="form-group">
		                                           <label for="descricaoServico" class=" form-control-label"><b>Descrição do Serviço</b> </label>
		                                           <textarea name="textarea-input" id="descricaoServico" rows="6" placeholder="Explique detalhadamente qual será o serviço que vai ser executado..." class="form-control"></textarea>	                                          
		                                         </div>
                                               </div>
                                       </div>
                                       
                                       
                                       <div class="row">
                                         <div class="col-md-6">
	                                            <div class="form-group">
		                                            <label for="" class=" form-control-label"><b>Prazo do Serviço(em dias)</b></label>
		                                            <input type="text" id="prazo" placeholder="" class="form-control">
	                                          </div>
                                          </div>
                                          <div class="col-md-6">
	                                            <div class="form-group">
		                                            <label for="" class=" form-control-label"><b>Data inicio</b></label>
		                                            <input type="text" id="data" placeholder="" class="form-control">
	                                          </div>
                                          </div>
                                          </div>
                                          <div class="row">
                                           <div class="col-md-6">
	                                            <div class="form-group">
		                                            <label for="" class=" form-control-label"><b>Forma de pagamento</b></label>
		                                             <select name="selectSm" id="formaPagamento" class="form-control-sm form-control">
                                                        <option value="">Selecione</option>
                                                        <option value="Cartão de Credito">Cartão de Credito</option>
                                                        <option value="Em dinheiro">Em dinheiro</option>
                                                        <option value="Boleto">Boleto</option>
                                                        
                                                    </select>
	                                          </div>
                                          </div>
                                           <div class="col-md-6">
	                                            <div class="form-group">
		                                            <label for="" class=" form-control-label"><b>Parcelas</b></label>
		                                             <select name="selectSm" id="parcelas" class="form-control-sm form-control">
                                                        <option value="0">Selecione</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                        <option value="6">6</option>
                                                        <option value="7">7</option>
                                                        <option value="8">8</option>
                                                        <option value="9">9</option>
                                                         <option value="10">10</option>
                                                          <option value="10">11</option>
                                                           <option value="10">12</option>
                                                    </select>
	                                          </div>
                                          </div>
                                       </div>
                                        <div class="row">
	                                         <div class="col-md-12">
	                                           <div class="form-group">
		                                            <label for="company" class=" form-control-label"><b>Valor total a ser pago pela execução dos serviços (em reais)</b> </label>
		                                            <input type="text" id="valor" placeholder="" class="form-control">
	                                          </div>
	                           
	                                         </div>
	                                          
                                       </div>
                                       <div class="row">
                                         <div class="col-md-12">
	                                            <div class="form-group">
		                                           <label for="company" class=" form-control-label"><b>Descrição da forma do pagamento</b> </label>
		                                           <textarea name="textarea-input" id="descricaoPagamento" rows="6" placeholder="Explique detalhadamente como será realizado o pagamento do serviço..." class="form-control"></textarea>	                                          
		                                         </div>
                                               </div>
                                        </div>
                                         <div class="row">
                                         <div class="col-md-12">
                                           <div class="form-group">
	                                            <label for="company" class=" form-control-label"><b>(Opcional) Multa cobrada em caso de atraso no pagamento do serviço (em porcentagem)</b></label>
	                                            <input type="text" id="multa" value="0" placeholder="Insira um numero inferior a 100" class="form-control">
                                          </div>
                           
                                         </div>
                                          
                                       </div>
                                       
                                       
                                    </div>
                                </div>
                            </div>
        
                            

                 
                                
                                <div class="row form-group"  style="float: right;">
                                    <div class="col col-md-3">
                                       <button type="button" id="btnEnviar" class="btn btn-primary">
                                        &nbsp;<i class="fas fa-forward"></i> Enviar contrato</button>
                                    </div>
                                 </div>

                            </section><br><br>
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
	var codigoContrato = $("#numeroContrato").val();
	 var idProposta = "${proposta.idProposta}";
	 
	function gerarCodigo(codigo,prefixo){
		
		 $.post('verificarCodigoContrato', {
			   prefixo:prefixo,
			   				

			}, function(dadosJSON) {
				
				$("#numeroContrato").val(dadosJSON);
				
				
			});
	}
	$(document).ready(function(){
		
		gerarCodigo(codigoContrato,idProposta);
		
	});
	
	
	$("#btnEnviar").on('click',function(){
		
		 var prazo = $("#prazo").val();
		 var data = $("#data").val();
		 var parcelas = $("#parcelas").val();
		 var pagamento = $("#formaPagamento").val();
		 var valor = $("#valor").val().replace(',','.');
		 var descricaoPagamento = $("#descricaoPagamento").val();
		 var descricaoServico = $("#descricaoServico").val();
		 var multa = $("#multa").val();
		 
		
		  if($('#descricaoServico').val() == null || $('#descricaoServico').val() == ""){
			  swal("Digite a descrição do serviço.","","warning");
			  
		  }else if($('#prazo').val() == null || $('#prazo').val() == ""){
			  swal("Digite o prazo do serviço.","","warning");
			  
		  }else if($('#data').val() == null || $('#data').val() == ""){
			  swal("Digite a data inicio do serviço.","","warning");
			  
		  }else if($('#formaPagamento').val() == null || $('#formaPagamento').val() == ""){
			  swal("Selecione a forma de pagamento do serviço.","","warning");
			  
		  }else if(($('#parcelas').val() == null || $('#parcelas').val() == "") && ($('#formaPagamento').val() == 3|| $('#formaPagamento').val() == 1)){
			  swal("Selecione a parcelas da forma de pagamento do serviço.","","warning");
			  
		  }else if($('#valor').val() == null || $('#valor').val() == ""){
			  swal("Digite o valor do serviço.","","warning");
			  
		  }else if($('#descricaoPagamento').val() == null || $('#descricaoPagamento').val() == ""){
			  swal("Digite a descrição do pagamento do serviço.","","warning");
			  
		  }else{
			  
				 swal({
					  title: "Você tem certeza que quer enviar esse contrato?",
					  text:"",
					  icon: "warning",
					  buttons:true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					 
					  if (willDelete) {
						  
						  
						  $.post('salvarContrato', {
							   idProposta:idProposta,
							   codigoContrato:codigoContrato,
						       prazo:prazo,
							   data:data,
							   parcelas:parcelas,
							   pagamento:pagamento,
							   valor:valor,
							   descricaoPagamento:descricaoPagamento,
							   descricaoServico:descricaoServico,
							   multa:multa,
												

							}, function(dadosJSON) {

								swal("Contrato enviado com sucesso!", {
								      icon: "success",
								    }).then((value) => {
								    	 swal("Aguarde aprovação do cliente!").then((value) => {
								    		   window.location = dadosJSON+"?cas="+idProposta;
								    	 });
								 });
								
							});
						  
						  
						  
						
						
					    
					   
					    
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
	<script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>  
   
   <script type="text/javascript">
   $(document).ready(function(){
	   $('#valor').mask('00000000#', {reverse: true});
	   $('#data').mask('00/00/0000', {reverse: true});
	   $('#prazo').mask('000000#', {reverse: true});
   });
   </script>
</body>

</html>
<!-- end document-->