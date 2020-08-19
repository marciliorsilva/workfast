<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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


<!-- Main CSS-->
<link
	href="<%=request.getContextPath()%>/resources/css/theme-cliente.css"
	rel="stylesheet" media="all">



<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body class="animsition">

	<c:import url="../cliente/menu.jsp" />


	<!-- Container de conte�do-->
	<div class="main-content main-content--pb30">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="fontawesome-list-wrap">
					<section>
						<h3 style="text-align: center;">Progresso do pedido</h3>
						<br>
						<ul id="progress">
							<li></span>Endere�o</li>
							<li>Informa��es</li>
							<li>Contrato</li>
							<li class="active">Efetuando</li>
							<li>Finalizado</li>
						</ul>

					</section>

					<section>
						<h2 style="text-align: center;">Servi�o em atendimento</h2>
						<br>
						<p>Aqui � a �rea que o prestador de servi�o colocar� qualquer
							imprevisto que houver, falta de mat�rias ou qualquer outra coisa
							que seja relevante para cumprir o servi�o..</p>
						<br>

						<div class="row form-group" style="float: right;">
							<div class="col col-md-3">
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">&nbsp;
									Visualizar Contrato</button>
							</div>
						</div>
						<br> <br> <br>

						<h4 style="text-align: center;">Ped�ncia(s)</h4>
						<br>
						
							<div  id="dadosPendencias">
								
							</div>




							
					</section>
					<br> <br>
				</div>
			</div>
		</div>
	</div>
	
		
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
								<strong>CONTRATO DE PRESTA��O DE SERVI�O</strong>
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
									</span>, <span id="span_id_documento_contratante1">Inscri��o
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

									<br />a pessoa jur�dica <strong><span
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
									presta��o de servi�o</strong>, conforme as seguintes cl�usulas.
							</p>
							<p>
								<strong><br /> <br />CL�USULA 1� - DO OBJETO</strong>
							</p>
							<p>
								Por meio deste contrato, a <strong>CONTRATADA</strong> se
								compromete a prestar � <strong>CONTRATANTE</strong> os seguintes
								servi�os:
							</p>
							<p style="padding-left: 30px;">
								<span id="span_id_servico"><span class="variable_vide"><div>
											<b> ${contrato.descricaoServicos}</b>
										</div></span></span>
							</p>
							<p>
								Par�grafo �nico. Os servi�os descritos acima ser�o prestados com
								total autonomia, liberdade de hor�rio, sem pessoalidade e sem
								qualquer subordina��o � <strong>CONTRATANTE</strong>.
							</p>
							<p>
								<strong><br /> <br />CL�USULA 2� - DO PRAZO</strong>
							</p>
							<p>
								O presente contrato tem prazo de:<strong> <span
									id="span_id_prazo"><span class="variable_vide">${contrato.prazo}
											dias</span></span></strong>, com in�cio em <span id="span_id_data_inicio"><span
									class="variable_vide"><b>${contrato.dataInicio}</b></span></span>.
							</p>
							<p>� 1�. Findo o prazo estipulado, o contrato ser�
								automaticamente rescindido, sem necessidade de aviso pr�vio da
								outra parte.</p>
							<p>� 2�. Ao final deste prazo, o contrato poder� ser
								renovado, por igual ou inferior per�odo de tempo.</p>
							<p>
								<strong><br /> <br />CL�USULA 3� - DA RETRIBUI��O</strong>
							</p>
							<p>
								Em contrapartida aos servi�os prestados, a <strong>CONTRATADA</strong>
								receber� a quantia de <strong>R$ <span
									id="span_id_valor"><span class="variable_vide">${contrato.valor}</span></span>
									(${contrato.valor} reais)
								</strong>, que ser� paga da seguinte maneira:
							</p>
							<p style="padding-left: 30px;">
								<span id="span_id_pagamento"><span class="variable_vide"><b>${contrato.descricaoPagamento}</b></span></span>
							</p>
							<p>
								<strong><br /> <br />CL�USULA 4� - DAS OBRIGA��ES </strong><strong>DA
									CONTRATADA</strong>
							</p>
							<p>
								S�o obriga��es da <strong>CONTRATADA</strong>:
							</p>
							<p style="padding-left: 30px;">I. prestar, com a devida
								dedica��o e seriedade e da forma e do modo ajustados, os
								servi�os descritos neste contrato;</p>
							<p style="padding-left: 30px;">II. respeitar as normas, as
								especifica��es t�cnicas e as condi��es de seguran�a aplic�veis �
								esp�cie de servi�os prestados;</p>
							<p style="padding-left: 30px;">
								III. fornecer as notas fiscais referentes aos pagamentos
								efetuados pela <strong>CONTRATANTE</strong>;
							</p>
							<p style="padding-left: 30px;">
								IV. responsabilizar-se pelos atos e omiss�es praticados por seus
								subordinados, bem como por quaisquer danos que os mesmos venham
								a sofrer ou causar para a <strong>CONTRATANTE</strong> ou
								terceiros;
							</p>
							<p style="padding-left: 30px;">V. arcar devidamente, nos
								termos da legisla��o trabalhista, com a remunera��o e demais
								verbas laborais devidas a seus subordinados, inclusive encargos
								fiscais e previdenci�rios referentes �s rela��es de trabalho;</p>
							<p style="padding-left: 30px;">VI. arcar com todas as
								despesas de natureza tribut�ria decorrentes dos servi�os
								especificados neste contrato;</p>
							<p style="padding-left: 30px;">VII. cumprir todas as
								determina��es impostas pelas autoridades p�blicas competentes,
								referentes a estes servi�os;</p>
							<p style="padding-left: 30px;">VIII. manter sigilosas, mesmo
								ap�s findo este contrato, as informa��es privilegiadas de
								qualquer natureza �s quais tenha acesso em virtude da execu��o
								destes servi�os;</p>
							<p style="padding-left: 30px;">IX. providenciar todos os
								meios e os equipamentos necess�rios � correta execu��o do
								servi�o.</p>
							<p>
								<strong><br /> <br />CL�USULA 5� - DAS OBRIGA��ES </strong><strong>DA</strong>
								<strong>CONTRATANTE</strong>
							</p>
							<p>
								S�o obriga��es da <strong>CONTRATANTE</strong>:
							</p>
							<p style="padding-left: 30px;">I. fornecer todas as
								informa��es necess�rias � realiza��o dos servi�os, inclusive
								especificando os detalhes e a forma de como eles devem ser
								entregues;</p>
							<p style="padding-left: 30px;">II. efetuar o pagamento, nas
								datas e nos termos definidos neste contrato;</p>
							<p style="padding-left: 30px;">
								III. comunicar imediatamente a <strong>CONTRATADA</strong> sobre
								eventuais reclama��es feitas contra seus subordinados, assim
								como sobre danos por eles causados.
							</p>
							<p>
								<strong><br /></strong><strong><br />CL�USULA 6� - DA
									RESCIS�O</strong><strong><br /></strong>
							</p>
							<p>A qualquer momento, poder�o as partes rescindir este
								contrato, desde que avisem previamente � outra parte, de acordo
								com os prazos seguintes:</p>
							<p style="padding-left: 30px;">I. se a retribui��o pela
								presta��o dos servi�os for fixada por m�s ou mais, com
								anteced�ncia de 8 (oito) dias;</p>
							<p style="padding-left: 30px;">II. se a retribui��o pela
								presta��o dos servi�os for fixada por semana ou quinzena, com
								anteced�ncia de 4 (quatro) dias;</p>
							<p style="padding-left: 30px;">III. se o prazo do contrato
								for menor que 7 (sete) dias, na v�spera.</p>
							<p>
								� 1�. A rescis�o sem justa causa por parte da <strong>CONTRATADA</strong>
								n�o lhe retira o direito ao recebimento das retribui��es j�
								vencidas, por�m sujeita-lhe ao pagamento de perdas e danos � <strong>CONTRATANTE</strong>.
							</p>
							<p>
								� 2�. A rescis�o sem justa causa por parte da <strong>CONTRATANTE</strong>
								obriga-lhe a pagar � <strong>CONTRATADA</strong> por inteiro as
								retribui��es j� vencidas e por metade as que lhe seriam devidas
								at� o termo legal do contrato.
							</p>
							<p>� 3�. N�o ser�o aplic�veis os prazos fixados nesta
								cl�usula �s rescis�es por justa causa.</p>
							<p>
								� 4�. A rescis�o com justa causa, realizada por qualquer uma das
								partes, n�o exime a <strong>CONTRATANTE</strong> do pagamento
								das retribui��es j� vencidas.
							</p>
							<p>
								� 5�. A rescis�o com justa causa por parte da <strong>CONTRATANTE</strong>
								obriga a devolu��o pela <strong>CONTRATADA</strong> dos valores
								j� pagos referentes a servi�os n�o desenvolvidos.
							</p>
							<p>
								<strong><br /> <br />CL�USULA 7� - DA</strong> <strong>EXTIN��O
									DO CONTRATO</strong>
							</p>
							<p>O presente contrato de presta��o de servi�o extingue-se
								mediante a ocorr�ncia de uma das seguintes hip�teses:</p>
							<p style="padding-left: 30px;">I. morte de qualquer das
								partes;</p>
							<p style="padding-left: 30px;">II. conclus�o do servi�o;</p>
							<p style="padding-left: 30px;">III. rescis�o do contrato
								mediante aviso pr�vio, por inadimplemento de qualquer das partes
								ou pela impossibilidade da continua��o do contrato, motivada por
								for�a maior.</p>
							<p>
								Par�grafo �nico. Ainda que a extin��o do contrato tenha sido
								realizada pela <strong>CONTRATADA</strong> sem justo motivo,
								esta ter� direito a exigir da <strong>CONTRATANTE</strong> a
								declara��o de que o contrato est� findo.
							</p>
							<c:if test="${contrato.multa != 0 }">
								<div id="clausula8">
									<p>
										<strong><br /> <br />CL�USULA 8� - DO
											DESCUMPRIMENTO</strong>
									</p>
									<p>
										O descumprimento de quaisquer das obriga��es e das cl�usulas
										fixadas neste contrato, seja pela <strong>CONTRATANTE</strong>
										ou pela <strong>CONTRATADA</strong>, ensejar� a sua imediata
										rescis�o, por justa causa, e sujeitar� o infrator ao pagamento
										de <strong>multa correspondente a </strong><strong><span
											id="span_id_multa_descumprimento"><span
												class="variable_vide">contrato.multa</span></span>% (contrato.multa
											por cento)</strong> <strong>da retribui��o total</strong>.
									</p>
								</div>
							</c:if>


							<p>
								<strong><br /> <br />CL�USULA 9� - DAS DISPOSI��ES
									GERAIS</strong>
							</p>
							<p>Ao assinarem este instrumento, as partes concordam ainda
								que:</p>
							<p style="padding-left: 30px;">
								a) nem a <strong>CONTRATANTE</strong> poder� transferir a outrem
								o direito aos servi�os ajustados, nem a <strong>CONTRATADA</strong>,
								sem aprazimento da outra parte, dar substituto que os preste;
							</p>

							<p style="padding-left: 30px;">b) a mera toler�ncia pelas
								partes com rela��o ao descumprimento de quaisquer dos termos
								ajustados neste contrato n�o dever� ser considerada como
								desist�ncia de sua exig�ncia;</p>
							<p style="padding-left: 30px;">c) o presente contrato n�o
								gera direito de exclusividade entre as partes;</p>
							<p style="padding-left: 30px;">
								d) desde que n�o haja incompatibilidade de hor�rios ou de
								interesses, a <strong>CONTRATADA</strong> poder� desempenhar
								suas atividades para terceiros em geral;
							</p>
							<p style="padding-left: 30px;">
								e) poder�, ainda, a <strong>CONTRATANTE</strong> contratar um
								terceiro para realizar os mesmos servi�os descritos neste
								contrato, a t�tulo de complementaridade;
							</p>
							<p style="padding-left: 30px;">f) eventuais altera��es deste
								contrato dever�o ser realizadas por meio de termo aditivo,
								devidamente assinado pelas partes</p>
							<p>
								<strong><br /> <br />CL�USULA 10� - <span
									class="flou"></span></strong>
							</p>

							<p>
								<br />E por estarem, assim, de justo acordo, as partes assinam
								este instrumento em 02 (duas) vias de id�ntico conte�do.
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
	
	<script>
	function carregarPendencias(){
		
		//encaminhando os valores do formulario para ser processadas 
		$.post('ListarPendenciasSolicitacao',{
		   cas:"${solicitacao.idSolicitacaoContrato}",
		 }, function(dadosJSON){
			  var linhas = '';
			  
			  linhas += '<div class="table-responsive table-responsive-data2">';
			  linhas += '<table class="table table-data2">';
			  linhas += '<thead>';
				  linhas += '<tr>';
					  linhas += '<th><h4>Ped�ncia(s) j� enviada(s) por voc�</h4></th>';
					  linhas += '<th></th>';
				  linhas += '</tr>';
			  linhas += ' </thead>';
			  
				$(dadosJSON).each(function (i) {
		
				    linhas += '<tr>';
					    linhas += '<td>'+dadosJSON[i].mensagem+' <br><br> <b style="color:blue"> Data Postado: '+dadosJSON[i].dataPostagem+ ' </b></td>';
					    linhas += '<td><div class="table-data-feature">';
					    linhas += '<button onclick="deletar('+ dadosJSON[i].idPendencias +')" class="item" data-toggle="tooltip" data-placement="top" title="Apagar Ped�ncia" >';
					    linhas += '<i class="zmdi zmdi-delete"></i></button></div></td>';
				    linhas += '</tr>';
				    
				  
				    
			    linhas += '</tbody>';
			    	
				});
				
			  
				linhas += ' </table>';
				linhas += ' </div>';
	            
	                     
				$('#dadosPendencias').html(linhas);
				   
		 });
		
	}
	$(document).ready(function(){
		setInterval("carregarPendencias()", 5000);
	})
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