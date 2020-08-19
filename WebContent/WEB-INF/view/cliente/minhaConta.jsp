<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon"  href="<%=request.getContextPath()%>/resources/img/icon/fivicon.png">

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

    
    <!-- Main CSS-->
    <link href="<%=request.getContextPath()%>/resources/css/theme-cliente.css" rel="stylesheet" media="all">
    
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



<script type="text/javascript">

$(document).ready(function(){
   
    $("#form_alterarImagem").submit(function() {
		  
    	var foto = $("#foto").val();  
		var idUsuario = $("#id_usuario").val();

		 $.post('alteraImagem',{
	           
			 foto:foto,
			 idUsuario:idUsuario,
	          
	          }, function(data){  
	        	  alert("Foi!!! Graças a Deus");
	        	  //swal("Foto atualizada com sucesso.","","success");  	
	          });

		return false;
		
	});
    
    /*
    $("#form_atualizarDadosPessoais").submit(function() {
		  
    	var cpf = $("#cpf").val();  
		var rg = $("#rg").val();
		var email = $("#email").val();
		var nome = $("#nome").val();
		var senha = $("#senha").val();
		var sexo = $("#sexo").val();
		var dataNascimento = $("#dataNascimento").val();
		var idUsuario2 = $("#id_usuario2").val();

		 $.post('alterarDados',{
	           
			 cpf:foto,
			 rg:rg,
			 email:email,
			 nome:nome,
			 senha:sexo,
			 dataNascimento:dataNascimento,
			 idUsuario2:idUsuario2,
	          
	          }, function(data){    
	        	  swal("Dados atualizados com sucesso.","","success");  
	        	  //carregarPendencias();       	  
	          });

	return false;
	});
}); 

*/

</script>

<script>


/*
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

*/

</script>


</head>


<body class="animsition">

	<c:import url="../cliente/menu.jsp"/>
	
<!-- Container de conteúdo-->
            <div class="main-content main-content--pb30">
                <div class="section__content section__content--p30">   	

                    <!-- Conteiner de informações da conta do usuário -->
                    <div class="container-fluid" >
                        <div class="fontawesome-list-wrap">
                            <h2 style="text-align: center;"><b>Minha conta</b></h2><br>
                            <section>
                            
                            								  
								  <c:if test="${not empty mensagemFoto}">
									<br><div class="alert alert-success alert-dismissible">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
										${mensagemFoto}
									</div><br>
								 </c:if>
                            
                               <form action="alteraImagem" method="post" id="form_alterarImagem" enctype="multipart/form-data">
	                                <div class="row form-group">
	                                    <img src="<%=request.getContextPath()%>/resources/img/${usuarioLogado.foto}" class="img-responsive img-thumbnail" alt="foto" style="width: 150px; height: 144px; margin-left: 20px; ">   
	                                    <input type="file" class="btn btn-default" id="foto" name="file" required>
	                                    <input type="hidden" name="idUsuario" id="id_usuario" value="${usuarioLogado.idUsuario}" required> 
	                                </div>
	                           
	                                 <div class="row form-group" >    
	                                 	<div class="col col-md-3">        
	                                 	<button type="submit" id="alterarFoto" class="btn btn-primary" > &nbsp;
	                                 		<i class="fas fa-upload"></i> Enviar foto</button>    
	                                 	</div> 
	                                 </div>     
	 						  </form>
	 						  
	 						 
							  
								  <c:if test="${not empty mensagem}">
									<br><div class="alert alert-success alert-dismissible">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
										${mensagem}
									</div><br>
								</c:if>
	 						  <!-- Dados pessoais -->
	 						  
	 						  <form action="alterarDadosPessoaisCliente" method="post" id="form_atualizarDadosPessoais">
                                 <h3 style="text-align: center;">Dados Pessoais</h3><br>

                                <div class="row form-group" style="margin-top: 20px;">
                                    <div class="col col-md-3">
                                         <label for="cpf" class=" form-control-label">CPF:</label>
                                    </div>
                                    <div class="col-12 col-md-5">
                                         <input type="text" name="cpf" id="cpf" value="${dadosPessoais.cpfCnpj}" class="form-control" required>
                                    </div>
                                 </div>
                                 
                                  <input type="hidden" id="id_usuario2" name="idUsuario" value="${usuarioLogado.idUsuario}" required>
                                  
                                 <div class="row form-group" style="margin-top: 20px;">
                                    <div class="col col-md-3">
                                         <label for="cpf" class=" form-control-label">RG:</label>
                                    </div>
                                    <div class="col-12 col-md-5">
                                         <input type="text" name="rgIe" id="rg" value="${dadosPessoais.rgIe}" class="form-control" required>
                                    </div>
                                 </div>
                               

                                <div class="row form-group" style="margin-top: 20px;">
                                    <div class="col col-md-3">
                                         <label for="email" class=" form-control-label">Email:</label>
                                    </div>
                                    <div class="col-12 col-md-5">
                                         <input type="email" name="email" value="${usuarioLogado.email}" id="email" class="form-control" required>
                                    </div>
                                 </div>

                                 <div class="row form-group" style="margin-top: 20px;">
                                    <div class="col col-md-3">
                                         <label for="nome" class=" form-control-label">Nome:</label>
                                    </div>
                                    <div class="col-12 col-md-5">
                                         <input type="text" name="nome" value="${usuarioLogado.nome}" id="nome" class="form-control" required>
                                    </div>
                                 </div>

                                 <div class="row form-group">
                                    <div class="col col-md-3">
                                         <label for="senha"  class=" form-control-label">Senha:</label>
                                    </div>
                                    <div class="col-12 col-md-5">
                                         <input type="password" name="senha" value="${usuarioLogado.senha}" id="senha"  class="form-control" required>
                                    </div>
                                 </div>

                                  <div class="row form-group">
                                    <div class="col col-md-3">
                                       <label for="select"  class=" form-control-label">Sexo:</label>
                                     </div>
                                          <div class="col-12 col-md-5">
                                               <select required name="sexo" id="sexo" class="form-control">
                                                       <option value="M">Masculino</option>
                                                       <option value="F">Feminino</option>
                                               </select>
                                           </div>
                                   </div>


                                   <div class="row form-group">
                                    <div class="col col-md-3">
                                         <label for="data"  class=" form-control-label">Data de nascimento:</label>
                                    </div>
                                    
                                    <div class="col-12 col-md-5">
                                         <input required type="text" name="dataNascimento" id="dataNascimento" value="<fmt:formatDate
										value="${dadosPessoais.dataNascimento}" type="both"
										pattern="dd/MM/yyyy" dateStyle="full" />" placeholder="00/00/0000" class="form-control">
                                    </div>
                                 </div>
                               
 
                                
                                <!-- Fim do Filtro de profissão-->
                                <div class="row form-group" style="float: right;">
                                    <div class="col col-md-3">
                                        <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-upload"></i>&nbsp; Atualizar dados</button>
                                    </div>
                                 </div>
                                 
                              </form>
                              
                            </section><br><br>
                        

                        </div>
                    </div>
                    
                    		<section >
				                <div class="container-fluid">
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