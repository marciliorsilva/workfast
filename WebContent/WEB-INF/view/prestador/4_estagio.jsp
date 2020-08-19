<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.min.js"></script>

	

<script type="text/javascript">

$(document).ready(function(){
	carregarPendencias();
});


$(document).ready(function(){
	$("#form_cadastroPendencias").submit(function() {
	    		  
			   var mensagem = $("#mensagem").val();  
			   var idContrato = $("#id_contrato").val();
  
			 $.post('adicionarPendencias',{
		           
				 mensagem:mensagem,
				 idContrato:idContrato,
		          
		          }, function(data){    
		        	  swal("Pendência cadastrada com sucesso.","","success"); 
		        	  carregarPendencias();
		        	  $("#mensagem").val("");  
		          });

		return false;
	  });
});

function carregarPendencias(){
	
	//encaminhando os valores do formulario para ser processadas 
	$.post('ListarPendencias',{
	   
	 }, function(dadosJSON){
		  var linhas = '';
		  
		  linhas += '<div class="table-responsive table-responsive-data2">';
		  linhas += '<table class="table table-data2">';
		  linhas += '<thead>';
			  linhas += '<tr>';
				  linhas += '<th><h4>Pedência(s) já enviada(s) por você</h4></th>';
				  linhas += '<th></th>';
			  linhas += '</tr>';
		  linhas += ' </thead>';
		  
			$(dadosJSON).each(function (i) {
	
			    linhas += '<tr>';
				    linhas += '<td>'+dadosJSON[i].mensagem+' <br><br> <b style="color:blue"> Data Postado: '+dadosJSON[i].dataPostagem+ ' </b></td>';
				    linhas += '<td><div class="table-data-feature">';
				    linhas += '<button onclick="deletar('+ dadosJSON[i].idPendencias +')" class="item" data-toggle="tooltip" data-placement="top" title="Apagar Pedência" >';
				    linhas += '<i class="zmdi zmdi-delete"></i></button></div></td>';
			    linhas += '</tr>';
			    
			  
			    
		    linhas += '</tbody>';
		    	
			});
			
		  
			linhas += ' </table>';
			linhas += ' </div>';
            
                     
			$('#dadosPendencias').html(linhas);
			   
	 });
	
}


</script>
	


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
                                            <li >Contrato</li>
                                            <li class="active">Efetuando</li>
                                            <li>Finalizado</li>
                                    </ul>
                                    
                                </section>

                            <section >
                               <h2 style="text-align: center;">Efetuando o serviço</h2><br>
                                <c:if test="${solicitacao.usuario.tipo_usuario == '1'}">
									<h3 style="text-align: center;"> ${solicitacao.usuario.nome}</h3><br> 
							      </c:if>
							      <c:if test="${solicitacao.usuario.tipo_usuario == '2'}">
									 <h4 style="text-align: center;"> ${clienteDados.nomeFantasia}</h4><br>
							      </c:if>
                                 <h4 style="text-align: center;"> Serviço: ${solicitacao.usuarioServico.servico.nome}</h4><br>
                                <p>Nesta etapa você poderá enviar pedências ao cliente, como faltas de matérias etc. Esta estapa poderá ser vista pelo usuário como serviço em andamento.</p><br>

                                <h4 style="text-align: center;"> Envie pendências ao Cliente</h4><br>

								<form id="form_cadastroPendencias" action="adicionarPendencias" method="post" >													
	                                <textarea requiered="" name="mensagem" id="mensagem" class="form-control" placeholder="Ex.: Olá, cliente!  Você precisa comprar esses materiais para continuar o serviço (...)"></textarea><br>
									<input type="hidden" id="id_contrato" name="solicitacaoContrato" value="${solicitacao.idSolicitacaoContrato}">
									
	                                <div class="row form-group"  style="float: right;">
	                                    <div class="col col-md-3">
	                                        <button type="submit" class="btn btn-primary">Enviar</button>
	                                    </div>
	                                 </div><br><br><br><br>    
                                </form>

							<div id="dadosPendencias"></div>
                             <br><br><br>

                 
                                <!-- Fim do Filtro de profissão-->
                                <div class="row form-group"  style="float: right;">
                                    <div class="col col-md-3">
                                       <a href="QuintaEtapa?cas=${solicitacao.idSolicitacaoContrato }"> <button type="button" class="btn btn-primary">
                                        &nbsp;<i class="fas fa-forward"></i> Finalizar serviço</button></a>
                                    </div>
                                 </div>
                                 <div class="row form-group"  style="float: left;">
                                    <div class="col col-md-3">
                                        <button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                        &nbsp;<i class="fas fa-forward"></i>Visualizar Contrato</button>
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
		
		 <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Contrato</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          
						<div class="col-lg-12 col-md-12"
							style="height: 400px; overflow: auto;" id="contrato">


							<span class="stabilisation"></span>
							<p style="text-align: center;">
								<strong>CONTRATO DE PRESTAÇÃO DE SERVIÇO</strong>
							</p>
							<p>
								<br /> <em><br />Entre:</em>
							</p>
							<p>
								<c:if test="${solicitacao.usuario.tipo_usuario == '1'}">
									<strong><br /> <span id="span_id_nome_contratante1"><span
											class="variable_vide">${solicitacao.usuario.nome}</span></span></strong>
									<span class="variable_vide"></span>
									</span>, <span id="span_id_documento_contratante1">Carteira de
										Identidade (RG)</span> n. <span
										id="span_id_numero_documento_contratante1"><span
										class="variable_vide"> ${clienteDados.rgIe}</span></span>, CPF n. <span
										id="span_id_cpf_contratante1"><span
										class="variable_vide"> ${clienteDados.cpfCnpj}</span></span>, residente em:
						    </c:if>

								<c:if test="${solicitacao.usuario.tipo_usuario == '2'}">
									<strong><br /> <span id="span_id_nome_contratante1"><span
											class="variable_vide"> ${clienteDados.razaoSocial} </span></span></strong>
									<span class="variable_vide"></span>
									</span>, <span id="span_id_documento_contratante1">Inscrição
										Estadual (IE) </span> n. <span
										id="span_id_numero_documento_contratante1"><span
										class="variable_vide">${clienteDados.rgIe }</span></span>, CNPJ n. <span
										id="span_id_cpf_contratante1"><span
										class="variable_vide"> ${clienteDados.cpfCnpj} </span></span>, com sede em:
						    </c:if>


							</p>
							<p style="padding-left: 30px;">
								<span id="span_id_endereco_contratante1"><span
									class="variable_vide"><div>
											<b> ${clienteEndereco.rua} -
												${clienteEndereco.numeroCasa} - ${clienteEndereco.bairro } -
												${clienteEndereco.cidade.nome} - ${clienteEndereco.cep}</b>
										</div></span></span>
							</p>
							<p>
								<br />doravante denominada <strong>CONTRATANTE</strong>,
							</p>
							<p>
								<br /> <br /> <em>e:</em>
							</p>
							<c:if
								test="${solicitacao.usuarioServico.usuario.tipo_usuario == '1'}">
								<p>

									<br />a pessoa fisica <strong><span
										id="span_id_nome_contratado1pj"><span
											class="variable_vide">
												${solicitacao.usuarioServico.usuario.nome}</span></span></strong>, CNPJ n. <span
										id="span_id_cnpj_contratado1pj"><span
										class="variable_vide"> ${prestadorDados.cpfCnpj}</span></span>, com
									sede em
								</p>
							</c:if>

							<c:if
								test="${solicitacao.usuarioServico.usuario.tipo_usuario == '2'}">
								<p>

									<br />a pessoa jurídica <strong><span
										id="span_id_nome_contratado1pj"><span
											class="variable_vide"></span> ${prestadorDados.razaoSocial} </span></strong>,
									CNPJ n. <span id="span_id_cnpj_contratado1pj"><span
										class="variable_vide"> ${prestadorDados.cpfCnpj} </span></span>, com
									sede em
								</p>
							</c:if>

							<p style="padding-left: 30px;">
								<span id="span_id_endereco_contratado1pj"><span
									class="variable_vide"><div>
											<b> ${prestadorEndereco.rua} -
												${prestadorEndereco.numeroCasa} - ${prestadorEndereco.bairro }
												- ${prestadorEndereco.cidade.nome} -
												${prestadorEndereco.cep}</b>
										</div></span></span>
							</p>
							<p>
								<br />doravante denominada <strong>CONTRATADA</strong>,
							</p>
							<p>
								<br /> <br />firma-se o presente <strong>contrato de
									prestação de serviço</strong>, conforme as seguintes cláusulas.
							</p>
							<p>
								<strong><br /> <br />CLÁUSULA 1ª - DO OBJETO</strong>
							</p>
							<p>
								Por meio deste contrato, a <strong>CONTRATADA</strong> se
								compromete a prestar à <strong>CONTRATANTE</strong> os seguintes
								serviços:
							</p>
							<p style="padding-left: 30px;">
								<span id="span_id_servico"><span class="variable_vide"><div>
											<b> ${contrato.descricaoServicos}</b>
										</div></span></span>
							</p>
							<p>
								Parágrafo único. Os serviços descritos acima serão prestados com
								total autonomia, liberdade de horário, sem pessoalidade e sem
								qualquer subordinação à <strong>CONTRATANTE</strong>.
							</p>
							<p>
								<strong><br /> <br />CLÁUSULA 2ª - DO PRAZO</strong>
							</p>
							<p>
								O presente contrato tem prazo de:<strong> <span
									id="span_id_prazo"><span class="variable_vide">${contrato.prazo}
											dias</span></span></strong>, com início em <span id="span_id_data_inicio"><span
									class="variable_vide"><b>${contrato.dataInicio}</b></span></span>.
							</p>
							<p>§ 1º. Findo o prazo estipulado, o contrato será
								automaticamente rescindido, sem necessidade de aviso prévio da
								outra parte.</p>
							<p>§ 2º. Ao final deste prazo, o contrato poderá ser
								renovado, por igual ou inferior período de tempo.</p>
							<p>
								<strong><br /> <br />CLÁUSULA 3ª - DA RETRIBUIÇÃO</strong>
							</p>
							<p>
								Em contrapartida aos serviços prestados, a <strong>CONTRATADA</strong>
								receberá a quantia de <strong>R$ <span
									id="span_id_valor"><span class="variable_vide">${contrato.valor}</span></span>
									(${contrato.valor} reais)
								</strong>, que será paga da seguinte maneira:
							</p>
							<p style="padding-left: 30px;">
								<span id="span_id_pagamento"><span class="variable_vide"><b>${contrato.descricaoPagamento}</b></span></span>
							</p>
							<p>
								<strong><br /> <br />CLÁUSULA 4ª - DAS OBRIGAÇÕES </strong><strong>DA
									CONTRATADA</strong>
							</p>
							<p>
								São obrigações da <strong>CONTRATADA</strong>:
							</p>
							<p style="padding-left: 30px;">I. prestar, com a devida
								dedicação e seriedade e da forma e do modo ajustados, os
								serviços descritos neste contrato;</p>
							<p style="padding-left: 30px;">II. respeitar as normas, as
								especificações técnicas e as condições de segurança aplicáveis à
								espécie de serviços prestados;</p>
							<p style="padding-left: 30px;">
								III. fornecer as notas fiscais referentes aos pagamentos
								efetuados pela <strong>CONTRATANTE</strong>;
							</p>
							<p style="padding-left: 30px;">
								IV. responsabilizar-se pelos atos e omissões praticados por seus
								subordinados, bem como por quaisquer danos que os mesmos venham
								a sofrer ou causar para a <strong>CONTRATANTE</strong> ou
								terceiros;
							</p>
							<p style="padding-left: 30px;">V. arcar devidamente, nos
								termos da legislação trabalhista, com a remuneração e demais
								verbas laborais devidas a seus subordinados, inclusive encargos
								fiscais e previdenciários referentes às relações de trabalho;</p>
							<p style="padding-left: 30px;">VI. arcar com todas as
								despesas de natureza tributária decorrentes dos serviços
								especificados neste contrato;</p>
							<p style="padding-left: 30px;">VII. cumprir todas as
								determinações impostas pelas autoridades públicas competentes,
								referentes a estes serviços;</p>
							<p style="padding-left: 30px;">VIII. manter sigilosas, mesmo
								após findo este contrato, as informações privilegiadas de
								qualquer natureza às quais tenha acesso em virtude da execução
								destes serviços;</p>
							<p style="padding-left: 30px;">IX. providenciar todos os
								meios e os equipamentos necessários à correta execução do
								serviço.</p>
							<p>
								<strong><br /> <br />CLÁUSULA 5ª - DAS OBRIGAÇÕES </strong><strong>DA</strong>
								<strong>CONTRATANTE</strong>
							</p>
							<p>
								São obrigações da <strong>CONTRATANTE</strong>:
							</p>
							<p style="padding-left: 30px;">I. fornecer todas as
								informações necessárias à realização dos serviços, inclusive
								especificando os detalhes e a forma de como eles devem ser
								entregues;</p>
							<p style="padding-left: 30px;">II. efetuar o pagamento, nas
								datas e nos termos definidos neste contrato;</p>
							<p style="padding-left: 30px;">
								III. comunicar imediatamente a <strong>CONTRATADA</strong> sobre
								eventuais reclamações feitas contra seus subordinados, assim
								como sobre danos por eles causados.
							</p>
							<p>
								<strong><br /></strong><strong><br />CLÁUSULA 6ª - DA
									RESCISÃO</strong><strong><br /></strong>
							</p>
							<p>A qualquer momento, poderão as partes rescindir este
								contrato, desde que avisem previamente à outra parte, de acordo
								com os prazos seguintes:</p>
							<p style="padding-left: 30px;">I. se a retribuição pela
								prestação dos serviços for fixada por mês ou mais, com
								antecedência de 8 (oito) dias;</p>
							<p style="padding-left: 30px;">II. se a retribuição pela
								prestação dos serviços for fixada por semana ou quinzena, com
								antecedência de 4 (quatro) dias;</p>
							<p style="padding-left: 30px;">III. se o prazo do contrato
								for menor que 7 (sete) dias, na véspera.</p>
							<p>
								§ 1º. A rescisão sem justa causa por parte da <strong>CONTRATADA</strong>
								não lhe retira o direito ao recebimento das retribuições já
								vencidas, porém sujeita-lhe ao pagamento de perdas e danos à <strong>CONTRATANTE</strong>.
							</p>
							<p>
								§ 2º. A rescisão sem justa causa por parte da <strong>CONTRATANTE</strong>
								obriga-lhe a pagar à <strong>CONTRATADA</strong> por inteiro as
								retribuições já vencidas e por metade as que lhe seriam devidas
								até o termo legal do contrato.
							</p>
							<p>§ 3º. Não serão aplicáveis os prazos fixados nesta
								cláusula às rescisões por justa causa.</p>
							<p>
								§ 4º. A rescisão com justa causa, realizada por qualquer uma das
								partes, não exime a <strong>CONTRATANTE</strong> do pagamento
								das retribuições já vencidas.
							</p>
							<p>
								§ 5º. A rescisão com justa causa por parte da <strong>CONTRATANTE</strong>
								obriga a devolução pela <strong>CONTRATADA</strong> dos valores
								já pagos referentes a serviços não desenvolvidos.
							</p>
							<p>
								<strong><br /> <br />CLÁUSULA 7ª - DA</strong> <strong>EXTINÇÃO
									DO CONTRATO</strong>
							</p>
							<p>O presente contrato de prestação de serviço extingue-se
								mediante a ocorrência de uma das seguintes hipóteses:</p>
							<p style="padding-left: 30px;">I. morte de qualquer das
								partes;</p>
							<p style="padding-left: 30px;">II. conclusão do serviço;</p>
							<p style="padding-left: 30px;">III. rescisão do contrato
								mediante aviso prévio, por inadimplemento de qualquer das partes
								ou pela impossibilidade da continuação do contrato, motivada por
								força maior.</p>
							<p>
								Parágrafo único. Ainda que a extinção do contrato tenha sido
								realizada pela <strong>CONTRATADA</strong> sem justo motivo,
								esta terá direito a exigir da <strong>CONTRATANTE</strong> a
								declaração de que o contrato está findo.
							</p>
							<c:if test="${contrato.multa != 0 }">
								<div id="clausula8">
									<p>
										<strong><br /> <br />CLÁUSULA 8ª - DO
											DESCUMPRIMENTO</strong>
									</p>
									<p>
										O descumprimento de quaisquer das obrigações e das cláusulas
										fixadas neste contrato, seja pela <strong>CONTRATANTE</strong>
										ou pela <strong>CONTRATADA</strong>, ensejará a sua imediata
										rescisão, por justa causa, e sujeitará o infrator ao pagamento
										de <strong>multa correspondente a </strong><strong><span
											id="span_id_multa_descumprimento"><span
												class="variable_vide">contrato.multa</span></span>% (contrato.multa
											por cento)</strong> <strong>da retribuição total</strong>.
									</p>
								</div>
							</c:if>


							<p>
								<strong><br /> <br />CLÁUSULA 9ª - DAS DISPOSIÇÕES
									GERAIS</strong>
							</p>
							<p>Ao assinarem este instrumento, as partes concordam ainda
								que:</p>
							<p style="padding-left: 30px;">
								a) nem a <strong>CONTRATANTE</strong> poderá transferir a outrem
								o direito aos serviços ajustados, nem a <strong>CONTRATADA</strong>,
								sem aprazimento da outra parte, dar substituto que os preste;
							</p>

							<p style="padding-left: 30px;">b) a mera tolerância pelas
								partes com relação ao descumprimento de quaisquer dos termos
								ajustados neste contrato não deverá ser considerada como
								desistência de sua exigência;</p>
							<p style="padding-left: 30px;">c) o presente contrato não
								gera direito de exclusividade entre as partes;</p>
							<p style="padding-left: 30px;">
								d) desde que não haja incompatibilidade de horários ou de
								interesses, a <strong>CONTRATADA</strong> poderá desempenhar
								suas atividades para terceiros em geral;
							</p>
							<p style="padding-left: 30px;">
								e) poderá, ainda, a <strong>CONTRATANTE</strong> contratar um
								terceiro para realizar os mesmos serviços descritos neste
								contrato, a título de complementaridade;
							</p>
							<p style="padding-left: 30px;">f) eventuais alterações deste
								contrato deverão ser realizadas por meio de termo aditivo,
								devidamente assinado pelas partes</p>
							<p>
								<strong><br /> <br />CLÁUSULA 10ª - <span
									class="flou"></span></strong>
							</p>

							<p>
								<br />E por estarem, assim, de justo acordo, as partes assinam
								este instrumento em 02 (duas) vias de idêntico conteúdo.
							</p>
							<p style="text-align: center;">
								<br /> <br />
							</p>
							<p style="text-align: center;">
								.........................................<span
									style="color: #ffffff;">.</span>,<span style="color: #ffffff;">.</span>.........<span
									style="color: #ffffff;">.</span>de<span style="color: #ffffff;">.</span>................................<span
									style="color: #ffffff;">.</span>de<span style="color: #ffffff;">.</span>.............
							</p>
							<p style="text-align: center;">(Local e data de assinatura)</p>
							<p style="text-align: left;">
								<center><strong><br /> <br /> <br />CONTRATANTE:</strong></center>
							</p>
							<p style="text-align: center;">
								<br />_________________________________________
							</p>
							<p style="text-align: center;">
								<strong><span id="span_id_nome_contratante1"><span
										class="variable_vide">________</span></span></strong>
							</p>
							<p style="text-align: left;">
								<center><strong><br /> <br /> <br /></strong><strong>CONTRATADA</strong><strong>:</strong></center>
							</p>
							<p style="text-align: center;">
								<br />_________________________________________
							</p>
							
							
							<p style="text-align: left;">
								<strong><br /> <br /> <br /></strong>
							</p>





						</div>

        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
         <button type="button" onclick="javascript:demoFromHTML()" class="btn btn-secondary" >Gerar PDF</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        </div>
        
      </div>
    </div>
  </div>

	</div>

	</div>
	
	<script>
	var gerarPdf = false;
	function demoFromHTML() {
		$('#myModal').modal('hide');
	    var pdf = new jsPDF('p', 'pt', 'letter');
	    // source can be HTML-formatted string, or a reference
	    // to an actual DOM element from which the text will be scraped.
	    source = $('#contrato')[0];

	    // we support special element handlers. Register them with jQuery-style 
	    // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
	    // There is no support for any other type of selectors 
	    // (class, of compound) at this time.
	    specialElementHandlers = {
	        // element with id of "bypass" - jQuery style selector
	        '#bypassme': function (element, renderer) {
	            // true = "handled elsewhere, bypass text extraction"
	            return true
	        }
	    };
	    margins = {
	                bottom: 60,
	                width: 522
	    };
	    // all coords and widths are in jsPDF instance's declared units
	    // 'inches' in this case
	    pdf.fromHTML(
	        source, // HTML string or DOM elem ref.
	        margins.left, // x coord
	        margins.top, {// y coord
	            'width': margins.width, // max width of content on PDF
	            'elementHandlers': specialElementHandlers
	        },
	        function (dispose) {
	            // dispose: object with X, Y of the last line add to the PDF 
	            //          this allow the insertion of new lines after html
	            pdf.save('contrato.pdf');
	        
	            gerarPdf = true;
	        
	        }
	        , margins);
	}
	function deletar(id) {
		swal({
		  title: "Você tem certeza?",
		  text: "Uma vez deletado, você não poderá recuperar esta pendência",
		  icon: "error",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {  
			  $.post('apagarPendencia',{
					 idPendencia:id,
			          
			          }, function(data){    
			        	  swal("Pendência apagada com sucesso.","","success"); 
			        	  carregarPendencias();
			          });
		  }
		});  
}
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