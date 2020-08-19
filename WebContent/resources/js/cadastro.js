
		$(document).ready(function(){
			
			function bloquear() {
			    alert("bloquear");
			}
			
			
            function desbloquear() {
            	alert("desbloquear");
			}

			//Função que muda o input do tipo passwd para text
			$("#olho").click(function(){
				var senha = $("#senha");
				var olho = $("#olho");

				olho.mousedown(function() {
					senha.attr("type", "text");
				});

				olho.mouseup(function() {
					senha.attr("type", "password");
				});


				$("#olho").mouseout(function() { 
					$("#senha").attr("type", "password");
				});

			});

			//Validações do formulário 

			$("#form_cadastro").validate({
					//Regras de validação
					rules:{
						
						
						nome:{
							required: true,
							maxlength: 45,
							minlength: 2
						},

						email:{
							required: true,
							maxlength: 100,
							minlength: 8,
							email: true,
							remote:{
								url:"disponivel",
								type:"get",
								data:{
									email: function(){
										return $("#email").val();
									}
								}
							}
						},

						senha:{
							required: true,
							rangelength: [6,18]
						},

						senha2:{
							required: true,
							equalTo: "#senha"
						},

						contrato:{
							required: true

						}, 
						
						tipo_acesso:{
							required: true,
						}

					},

					messages:{
						
						nome:{
							required: "<span class='glyphicon glyphicon-asterisk'></span> Este campo é obrigatório.",
							minlength: "O nome deve ter no mínimo 2 caracteres.",
							maxlength: "O nome deve ter no máximo 45 caracteres."	
							
						},
						
						email:{
							required: "<span class='glyphicon glyphicon-asterisk'></span> Este campo é obrigatório.",
							minlength: "O e-mail deve ter no mínimo 8 caracteres.",
							maxlength: "O e-mail deve ter no máximo 100 caracteres.",
							remote: "<span class='glyphicon glyphicon-remove'></span> Este e-mail já está sendo usado por outra pessoa."
							
						},

						senha:{
							required: "<span class='glyphicon glyphicon-asterisk'></span> Este campo é obrigatório",
							rangelength: "Por favor, forneça uma senha entre 6 e 18 caracteres de comprimento.",
							
						},

						senha2:{
							required: "<span class='glyphicon glyphicon-asterisk'></span> Este campo é obrigatório",
							equalTo: "As senhas são diferentes, verifique."

						},

						contrato:{
							required: "<span class='glyphicon glyphicon-asterisk'></span> Você deve aceitar os termos."

						},
						
						tipo_acesso:{
							required:"<span class='glyphicon glyphicon-asterisk'></span> Este campo é obrigatório",
						}
					}


				});

		});

		
