<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon"  href="<%=request.getContextPath()%>/resources/img/icon/fivicon.png">
<title>WorkFast</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Login google -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="1012288331395-k24u9pj63e593k273179pbtrigshvj2p.apps.googleusercontent.com">

<!-- Fonte Google -->
 <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
 

<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Jquery validate -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>


<!-- Código JavaScript desta Página(Página de login) -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/entrar.js"></script>

<!-- Código css desta Página(Página de cadastro) -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/entrar.css" />
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>

	<div class="container">
		<div>
			<img id="img_logo"
				src="<%=request.getContextPath()%>/resources/img/logo_workfast.png"
				class="img-responsive">
		</div>
		<div>
			<center>${msg}</center>
		</div>

		<div class="panel panel-default col-sm-4" id="container_login">

			<h2 id="txt_login">Efetuar login</h2>

			<!-- Formulário de cadastro-->
			<div class="panel-body">


				<form action="#" id="form_login">

					<div class="form-group">
						<label for="email">E-mail:</label> <input type="text"
							class="form-control" id="inputLogin"
							placeholder="Digite  seu e-mail" name="email"
							value="${usuario.email}" maxlength="60" required="required"
							tabindex="1">
					</div>

					<div class="form-group">
						<label>Senha:</label> <input type="password" class="form-control"
							id="inputSenha" placeholder="Digite sua senha" name="senha"
							value="${usuario.senha}" maxlength="20" required="required"
							tabindex="2">
					</div>
			</div>

			<div>
				<a href="" style="color: red; font-weight: bold;"
					data-toggle="modal" data-target="#modal_recuperar_senha">Esqueceu
					sua senha?</a>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" id="button_login" class="btn btn-primary">
						Entrar</button>
				</div>
			</div>

			<div>
				<p id="p_mensagem">
					Ainda não tem uma conta? <a href="cadastro" style="color: green;"
						data-toggle="tooltip" data-placement="top"
						title="Se clicar você será redirecionado para a página de cadastro">Cadastrar-se</a>
				</p>
			</div>

			</form>

			<hr>

			

				<div>
					<center>
						<p id="p_mensagem">
							Quer voltar para página inicial? <a href="index"
								style="color: blue;" data-toggle="tooltip" data-placement="top"
								title="Se clicar você será redirecionado para a página inicial">Clique
								aqui</a>
						</p>
					</center>
				</div>
			


	</div>
	</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="modal_recuperar_senha" role="dialog"
		media="all" data-backdrop="static">
		<div class="modal-dialog modal-sm">
			<!-- Conteúdo da modal-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Recuperar senha</h4>
				</div>

				<div class="modal-body">
					<form id="form_recuperar_senha">
						<div class="form-group">

							<!-- Formulário para recuperar senha -->
							<label for="email">Informe seu e-mail:</label> <input
								type="email" name="email2" class="form-control"
								placeholder="Digite seu e-mail">
						</div>
						<button class="btn btn-primary form-control">Enviar</button>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript">
 $(document).ready(function(){
	 $("#form_login").submit(function() {

		 var email = $("#inputLogin").val();
	     
		 var senha = $("#inputSenha").val();
         
		 if(email != "" && senha != ""){
	          $.post("efetuarLogin",{
		            email:email,
		            senha:senha,
		            
		          }, function(data){
		             
		             
		             if(data == "blocked"){
		            	 
		            	 swal("Acesso bloqueado!", "Seu acesso ao sistema esta bloqueado temporariamente!", "error");
		            	 
		            	 		            		
			
		             }else if(data == "notFoud"){
		            	 
		            	 swal("Erro ao efetuar o login!", "Usuário não encontrado", "error");
		            	 
							
		            	 
		             }else{
		            	 window.location = data;
		             }
		             
		          });

		      
		        
		         
		       
			 
		 }
		 return false;
      });
 });
</script>

</body>
</html>