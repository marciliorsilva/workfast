<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="icon"  href="<%=request.getContextPath()%>/resources/img/icon/fivicon.png">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <!-- Required meta tags-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    

    <!-- Title Page-->
    <title>WorkFast - Cliente</title>

  <!-- Fontfaces CSS-->
    <link href="<%=request.getContextPath()%>/resources/css/font-face.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="<%=request.getContextPath()%>/resources/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

     
    <!-- Bootstrap CSS-->
    <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Jquery -->
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    
    <!-- Main CSS-->
    <link href="<%=request.getContextPath()%>/resources/css/theme-cliente.css" rel="stylesheet" media="all">

</head>
<body class="animsition">

	<c:import url="../cliente/menu.jsp"/>
	
	 <!-- Container de conteúdo-->
            <div class="main-content main-content--pb30">
                <div class="section__content section__content--p30">

                	<!-- Conteiner de Filtro -->
                    <div class="container-fluid">
                        <div class="fontawesome-list-wrap">
                            <section >
                                <h2 style="text-align: center;">Filtro</h2><br>
                                
                                <!-- Filtro de estado -->
                                <div class="row form-group">
                                    
                                            <div class="col-lg-4 col-md-3">
                                             <label for="select" class=" form-control-label"></label>
                                                <select name="estado" id="estado" class="form-control">
                                                        <option value="">Estado</option>
                                                        
															<c:forEach items="${listaEstado}" var="obj">
				
																<option value="${obj.idEstado}">${obj.nome}</option>
				
				
															</c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-lg-4 col-md-3">
                                              <label for="select" class=" form-control-label"></label>
                                                <select name="cidade" id="cidade" class="form-control">
                                                       <option value="">Cidade</option>
                                                       
                                                </select>
                                            </div>
                                            <div class="col-lg-4 col-md-3">
                                             <label for="select" class=" form-control-label"></label>
                                                <select name="categoria" id="categoria" class="form-control">
                                                        <option value="">Categoria de Serviço</option>
                                                        <c:forEach items="${listaCategoria}" var="obj">
				
																<option value="${obj.idCategoriaServico}">${obj.nome}</option>
				
				
															</c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-lg-12 col-md-12">
                                               <label for="select" class=" form-control-label"></label>
                                                <select name="servicos" id="servicos" class="form-control">
                                                      <option value="">Serviços</option>  
                                                </select>
                                            </div>
                                            <div class="col-lg-12 col-md-12">
                                            <br>
                                               <button style="float:right;" id="limparFiltro" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Limpar">Limpar filtro </button>
                                            </div>
                                     </div>
                                
                            </section> 
                        </div>
                    </div>

              
                    <!-- Conteiner de listagem de candidatos -->
                     <div class="main-content">
		                <div class="section__content section__content--p30">
		                    <div class="container-fluid">
		                        <div class="row" id="filtro">
		                          
		                         </div>
		                                                         
		                        </div>
		                     </div>
		                  </div>
                   
                       
                    


					
							<section >
				                <div class="container-fluid" style="margin-top: 30%;">
				                    <div class="row">
				                        <div class="col-md-12">
				                            <div class="copyright">
				                                <p>Copyright © 2018 Workfast. Todos direitos reservados.</p>
				                            </div>
				                        </div>
				                    </div>
				                </div>
           					 </section> 

                </div>
            </div>
            
	

   <script type="text/javascript">
   var idEstado = null;
   var idCidade = null;
   var idCategoria = null;
   var idServico = null;
   
   
   function popularFiltro(idEstado,idCidade,idCategoria,idServico){
	 
	   $('#filtro').html(' ').fadeOut(200);
	   $.post('listarFiltro', {
           idEstado:idEstado,
           idCidade:idCidade,
           idCategoria:idCategoria,
           idServico:idServico,
        	   
       }, function(dadosJSON){
     	  var linhas = " ";
     	 
				if(dadosJSON.length > 0){
					$(dadosJSON).each(function (i) {

		                   linhas += '<div class="col-md-4">';
		                        linhas += '<div class="card">';
		                            linhas += '<div class="card-header">';
		                                linhas += '<i class="far fa-list-alt"></i>';
		                                linhas += '<strong class="card-title pl-2"> '+dadosJSON[i].categoria+'</strong>';
		                            linhas += '</div>';
		                            linhas += '<div class="card-body">';
		                                linhas += '<div class="mx-auto d-block">';
		                                    linhas += '<img src="/workfast/resources/img/'+dadosJSON[i].foto+'" class="rounded-circle mx-auto d-block img-responsive" style="width: 150px; height: 144px;"  alt="Imagem do prestador ">';
		                                    if(dadosJSON[i].tipo == '1'){
		           						     
		                                    	linhas += '<h5 class="text-sm-center mt-2 mb-1"> '+dadosJSON[i].usuario+'</h5>';

			           			             }
			           						 if(dadosJSON[i].tipo == '2'){
			           			        	  
			           			        	   linhas += '<h5 class="text-sm-center mt-2 mb-1">  '+dadosJSON[i].nomeFantasia+'</h5>';

			           			             }
		                                                                        
		                                    linhas += '<div class="location text-sm-center">';
		                                    linhas += ' <i class="fa fa-map-marker"></i> '+dadosJSON[i].localizacao+'</div>';
		                                    linhas += '<div class="location text-sm-center"><i class="fas fa-star"></i>';
		                                    linhas += '<i class="fas fa-star"></i>';
		                                    linhas += '<i class="fas fa-star"></i>';
		                                    linhas += '<i class="fas fa-star"></i>';
		                                    linhas += '<i class="fas fa-star-half"></i>';
		                                       
		                                linhas += '</div>';
		                                linhas += '<hr>';
		                                linhas += '<div class="card-text text-sm-center">';
		                                linhas += ' <i class="fas fa-gears"></i> '+dadosJSON[i].servico+'</div>';
		                                  linhas +='<br><b>Descrição do serviço:</b><br><textarea disabled="disabled" style="resize: none" class="form-control" rows="5">'+dadosJSON[i].descricaoServico+'</textarea>';
		                                  
		                                linhas += '</div>';
		                                linhas += '<div class="card-footer">';
		                                linhas += '<a style="width:100%" href="solicitacaoServico?id='+dadosJSON[i].idUsuarioServico+'"><button style="width:100%" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Contratar">Solicitar Serviço <i class="fa fa-handshake-o "></i></button></a>';
		                            linhas += '</div>';
		                                linhas += '</div>';
		                                
		                            linhas += '</div>';
		                            
		                           
		                        linhas += '</div>';
		                    linhas += '</div>';
		                    linhas += '</div>';

						
						
						
						
					       	
					       	  
						
					});
					
					$('#filtro').html(linhas).fadeIn(1200);
					
				}else{
					$('#filtro').html('<div class="col-md-12 col-lg-12 col-sm-12"><br><br><center><span>Nenhum Prestador encontrado!</span></center>').fadeIn(1200);
				}

				
             
       });

   }
   
   $(document).ready(function(){
	   popularFiltro(idEstado,idCidade,idCategoria,idServico);
	   setInterval("popularFiltro(idEstado,idCidade,idCategoria,idServico)", 50000);
	   
   });
   var selectOption = document.getElementById("limparFiltro");
   selectOption.addEventListener('click', function(){
	   $("#estado").val($("#estado option[value='Estado']").val());
	   $("#cidade").val($("#cidade option[value='Cidade']").val());
	   $("#categoria").val($("#categoria option[value='Categoria de Serviço']").val());
	   $("#servicos").val($("#servicos option[value='Serviços']").val());
	   idEstado = null;
	   idCidade = null;
	   idCategoria = null;
	   idServico = null;
	   popularFiltro(null,null,null,null);
   });
   var selectOption = document.getElementById("estado");
   selectOption.addEventListener('change', function(){
   	$('#cidade').html("");
      var id = $(this).val();
     
      //encaminhando os valores do formulario para ser processadas 
        $.post('filtrarCidade', {
           idEstado:id
           
         }, function(dadosJSON){
       	  var linhas = '';
       	  linhas += "<option value='' >Cidade </option>";
				

				$(dadosJSON).each(function (i) {
				
					linhas += "<option value='"+dadosJSON[i].idCidade+"'>"+dadosJSON[i].nome+"</option>";
				
				});
				$('#cidade').html(linhas);
               
         });

      
       
        idEstado = id;
        popularFiltro(idEstado,idCidade,idCategoria,idServico);
     return false;// impedindo o encaminhamento
     
    
       
      
   });
   
   var selectOption = document.getElementById("cidade");
   selectOption.addEventListener('change', function(){
	   var id = $(this).val();
	   idCidade = id;
       popularFiltro(idEstado,idCidade,idCategoria,idServico);
   });

   
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
											linhas += "<option value='' >Serviços </option>";

											$(dadosJSON)
													.each(
															function(i) {

																linhas += "<option value='"+dadosJSON[i].idServico+"'>"
																		+ dadosJSON[i].nome
																		+ "</option>";

															});
											$('#servicos').html(linhas);

										});
						idCategoria = id;
				        popularFiltro(idEstado,idCidade,idCategoria,idServico);
						return false;// impedindo o encaminhamento

					});
	
	var selectOption = document.getElementById("servicos");
	   selectOption.addEventListener('change', function(){
		   var id = $(this).val();
		   idServico = id;
	       popularFiltro(idEstado,idCidade,idCategoria,idServico);
	   });

      
   
   </script>

    <!-- Jquery JS-->
    <script src="<%=request.getContextPath()%>/resources/vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="<%=request.getContextPath()%>/resources/vendor/slick/slick.min.js">
    </script>
    <script src="<%=request.getContextPath()%>/resources/vendor/wow/wow.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/animsition/animsition.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="<%=request.getContextPath()%>/resources/vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="<%=request.getContextPath()%>/resources/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="<%=request.getContextPath()%>/resources/js/main.js"></script>

</body>
</html>