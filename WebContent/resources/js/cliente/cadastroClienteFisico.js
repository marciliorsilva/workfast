
		$(document).ready(function(){
	
			//Validações do formulário 

			$("#form_cadastroCliente").validate({
					//Regras de validação
					rules:{
						
						cpfCnpj:{
							required: true,
							maxlength: 14,
							minlength: 14,
							remote:{
								url:"procurar_cpfCnpjCliente",
								type:"get",
								data:{
									cpfCnpj: function(){
										return $("#cpfCnpj").val();
									}
								}
							}
			
						},

						

						rgIe:{
							required: true,
							maxlength: 10,
							minlength: 9,
							remote:{
								url:"procurar_rgIeCliente",
								type:"get",
								data:{
									rgIe: function(){
										return $("#rgIe").val();
									}
								}
							}
						},

						dataNascimento:{
							required: true,
							maxlength: 10,
							minlength: 10
						},

						email:{
							email: true,
							maxlength: 50,
							minlength: 8

						}, 
							
						telefone:{
							maxlength: 14		,
							minlength: 14
						},
						
						celular:{
							maxlength: 16,
							minlength: 16
						}		

					},

					messages:{
						
						cpfCnpj:{
							required: "<span class='glyphicon glyphicon-asterisk'></span> Este campo é obrigatório.",
							minlength: "O CPF deve ter  11 digitos.",
							maxlength: "O CPF deve ter  11 digitos.",
							remote: "<span class='glyphicon glyphicon-remove'></span> Este CPF já está cadastrado no sistema."
							
						},
						
						rgIe:{
							required: "<span class='glyphicon glyphicon-asterisk'></span> Este campo é obrigatório.",
							minlength: "O RG deve ter  7 digitos.",
							maxlength: "O RG deve ter  7 digitos.",
							remote: "<span class='glyphicon glyphicon-remove'></span> Este RG já está cadastrado no sistema."
							
						},
						
						email:{
							required: "<span class='glyphicon glyphicon-asterisk'></span> Este campo é obrigatório.",
							minlength: "O e-mail deve ter no mínimo 8 caracteres.",
							maxlength: "O e-mail deve ter no máximo 50 caracteres.",
							
						},
						
						dataNascimento:{
							required: "<span class='glyphicon glyphicon-asterisk'></span> Este campo é obrigatório.",
							minlength: "A data de nascimento deve ter 8 caracteres.",
							maxlength: "A data de nascimento deve ter 8 caracteres.",
							
						},
						
						telefone:{
							minlength: "O telefone deve ter no mínimo 8 caracteres.",
							maxlength: "O telefone deve ter no máximo 8 caracteres.",
							
						},
						
						celular:{
							minlength: "O celular deve ter no mínimo 9 caracteres.",
							maxlength: "O celular deve ter no máximo 9 caracteres.",
							
						}	
						
					}


				});
			
			 $("#cpfCnpj").mask("999.999.999-99");
			
			 $("#dataNascimento").mask("99/99/9999"); 
			 
			 $("#telefone").mask("(99) 9999-9999"); 
			 
			 $("#celular").mask("(99) 9 9999-9999"); 
			 
			 $('#rgIe').mask('99.999.9999');
		

		});

		
