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

  .containerChat {
    border: 2px solid #dedede;
    background-color: #f1f1f1;
    border-radius: 5px;
    padding: 10px;
    width:50%;
    margin: 10px auto;
}

/* Darker chat container */
.darker {
    border-color: #ccc;
    background-color: #ddd;
   
}

/* Clear floats */
.containerChat::after {
    content: "";
    clear: both;
    display: table;
}

/* Style images */
.containerChat img {
    float: left;
    max-width: 60px;
    width: 100%;
    margin-right: 20px;
    border-radius: 50%;
}

/* Style the right image */
.containerChat img.right {
    float: right;
    margin-left: 20px;
    margin-right:0;
}

/* Style time text */
.time-right {
    float: right;
    color: #aaa;
}

/* Style time text */
.time-left {
    float: left;
    color: #999;
}

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


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
<!-- Main CSS-->
<link
	href="<%=request.getContextPath()%>/resources/css/theme-prestador.css"
	rel="stylesheet" media="all">
	

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
                                            <li class="active">Inf. Serviço</li>
                                            <li >Contrato</li>
                                            <li>Efetuando</li>
                                            <li>Finalizado</li>
                                    </ul>
                                    
                                </section>

                            <section >
                            <section>
                               <h2 style="text-align: center;">Informações do Serviço</h2><br>
                                <h2 style="text-align: center;"> - ${proposta.servico} -</h2><br>
                                <center><p> Aqui você terá um fórum para se comunicar com o cliente para tirar a suas dúvidas sobre o serviço que ele vai querer.</p></center><br>

                               
                            </section>
                                
                                
                                
                          <div class="main-content" style="margin-top: -130px;">
                            <div class="section__content section__content--p30">
                              <div class="container-fluid">
                                 <div class="row">									
									  
								    <div class="col-lg-12">
                                <div class="au-card au-card--no-shadow au-card--no-pad m-b-40 au-card--border" style="margin: 0 auto; width:  600px; " >
                                    <div class="au-card-title" style="background-image:url('/workfast/resources/images/bg-title-02.jpg');">
                                        <div class="bg-overlay bg-overlay--blue"></div>
                                        <h3>
                                            <i class="zmdi zmdi-comment-text"></i>Chat</h3>
                                       
                                    </div>
                                    <div class="au-inbox-wrap">
                                        <div class="au-chat au-chat--border">
                                            <div class="au-chat__title">
                                                <div class="au-chat-info">
                                                    <div class=" ">
                                                        <div class="avatar avatar--small">
                                                            <img src="/workfast/resources/img/${proposta.foto}" alt="">
                                                        </div>
                                                    </div>
                                                    <span class="nick">
                                                        <c:if test="${proposta.tipoUsuario == '1'}">
													        <a href="#">${proposta.nome}</a>
													    </c:if>
													    
													    <c:if test="${proposta.tipoUsuario == '2'}">
													        <a href="#">${proposta.nomeFantasia}</a>
													    </c:if>
                                                    
                                                        <a href="#"></a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div id="corpoChat" class="au-chat__content au-chat__content2 js-scrollbar5">
                                                <div id="chat"></div>
                                            </div>
                                            <div class="au-chat-textfield">
                                                <div  class="au-form-icon">
                                                    <input id="mensagem" class="au-input au-input--full au-input--h65" type="text" placeholder="Digite uma mensagem">
                                                    <button id="enviarMensagem" class="au-input-icon">
                                                        <i class="zmdi zmdi-mail-send"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
								  
							     </div>
							   </div>
						    </div>  
						  </div>		  
								  
								  
								 
								  
								
								
                                  <div class="row ">
                                    
                                    <div class="col col-md-12 " >
                                       <div class="form-group">
										 
										   <a style="float:right;" href="TerceiraEtapa?cas=${proposta.idProposta}"><button type="button" class="btn btn-primary" >
                                               &nbsp;<i class="fas fa-forward"></i> Ir ao contrato</button></a>
								       </div>
								       <div class="form-group">
										 
										   <button style="float:left;" type="button"  id="btnCancelar" class="btn btn-danger" >
                                               &nbsp;<i class="fas fa-forward"></i> Cancelar pedido</button>
								       </div>
                                      
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
	var idProposta = "${proposta.idProposta}";
    var idCliente = "${proposta.idCliente}";
    var idPrestador = "${usuarioLogado.idUsuario}";
    function verificarMensagemNova(id){
    	$.post('verificarMensagemNovaCliente', {
	           idProposta:id,
	          	           
	        	   
	       }, function(dadosJSON){
	    	   
	    	  if(dadosJSON == "novaMensagem"){
	    		  
	    		  alert("tem mensagem nova");
	    	  }else{
	    		  alert("nenhuma mensagem nova");
	    	  }
	    	   
	       });
    }
	function popularChat(idProposta,idCliente,idPrestador){
		 
		   $('#chat').html(' ').fadeOut(100);
		  
		   $.post('popularChat', {
	           idProposta:idProposta,
	           idCliente:idCliente,
	           idPrestador:idPrestador,
	           
	        	   
	       }, function(dadosJSON){
	     	  var linhas = " ";
	     	  
					if(dadosJSON.length > 0){
						
						$(dadosJSON).each(function (i) {
							
							if(dadosJSON[i].enviadoPor == "${usuarioLogado.idUsuario}"){
								linhas +='<div class="send-mess-wrap">';
								linhas +='<span class="mess-time">04 Sec. atrás</span>';
								linhas +='<div class="send-mess__inner">';
								linhas +='<div class="send-mess-list">';
								linhas +='<div class="send-mess-list">';
								  linhas +=' <div class="send-mess">'+dadosJSON[i].mensagem+'</div>';
							    linhas +='</div>';
							    linhas +='</div>';
								linhas +='</div>';
								
								
								
							}else{
								
								linhas +='<div class="recei-mess__inner">';
								linhas +='<span class="mess-time">12 Min ago</span>';
								linhas +=' <div class="recei-mess__inner">';
								linhas +=' <div class="recei-mess-list">';
								linhas +='<div class="recei-mess__inner">';
								linhas +='<div class="recei-mess">'+dadosJSON[i].mensagem+'</div>';
								
								 
							    linhas +='</div>';
								linhas +='</div>';
								linhas +='</div>';
								linhas +='</div>';
								linhas +='</div>';

							    
							}
								
							
						});
						$('#chat').html(linhas).fadeToggle();
						$(function(){
							var minhadiv = document.getElementById("corpoChat");
						    	minhadiv.scrollTop = minhadiv.scrollHeight;
						});
						
					}else{
						$('#chat').html('<br><br><center><span>Escreva uma mensagem!</span></center>').fadeIn(1200);
					}

					
	             
	       });

	   }
	
	  $(document).ready(function(){
		
		   popularChat(idProposta,idCliente,idPrestador);
		  
		   setInterval("popularChat(idProposta,idCliente,idPrestador);", 3000);
		   
	   });
	  
	  $("#enviarMensagem").on('click',function(){
		  if($('#mensagem').val() == null || $('#mensagem').val() == ""){
			  swal("Digite uma mensagem.","","warning");
			  
		  }else{
			  var msg = $('#mensagem').val();
			  $.post('enviarMensagemChatPrestador', {
		           msg:msg,
		           idPrestador:idPrestador,
		           idCliente:idCliente,
		           idProposta:idProposta,
		           
		        	   
		       }, function(dadosJSON){
		    	   
		    	   if(dadosJSON == "send"){
		    		   popularChat(idProposta,idCliente,idPrestador);
		    		   $('#mensagem').val('');
		    	   }
		       });
		  }
		  
	  });
	  
	  $("#btnCancelar").on('click',function(){
			 
		  swal({
			  title: "Você tem certeza que quer cancelar esse pedido?",
			  text:"",
			  icon: "warning",
			  buttons:true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			 
			  if (willDelete) {
				  
				  $.post('cancelarPedidoPrestador', {
					  cas:idProposta,
			           
			        	   
			       }, function(dadosJSON){
			    	   
			    	   swal("Pedido Cancelado com sucesso","","success")
			    	   .then((value) => {
			    	     window.location = dadosJSON;
			    	   });
			    	   
			    	  
			       });
				  
				  
				
				
			    
			   
			    
			  } 
			  
			});
			  
		
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