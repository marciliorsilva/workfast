		$(document).ready(function(){

			//Validações do formulário de login 

			$("#form_login").validate({
					//Regras de validação
					rules:{

						email:{
							required: true,
							maxlength: 100,
							minlength: 8,
							email: true
						},
						senha:{
							required: true,
							rangelength: [6,18]
						}			
					},

					messages:{
						email:{
							required: "Este campo é obrigatório.",
							minlength: "O e-mail deve ter no mínimo 8 caracteres.",
							maxlength: "O e-mail deve ter no máximo 100 caracteres.",
							email: "Coloque um e-mail valido."
						},
						senha:{
							required: "Este campo é obrigatório",
							rangelength: "Por favor, forneça uma senha entre 6 e 18 caracteres de comprimento.",	
						}
					}

				});


			$("#form_recuperar_senha").validate({

				rules:{
					email2:{
						required: true,
						maxlength: 100,
						minlength: 8,
						email: true

					}
				},

				messages:{
					email2:{
						required: "Este campo é obrigatório.",
						minlength: "O e-mail deve ter no mínimo 8 caracteres.",
						maxlength: "O e-mail deve ter no máximo 100 caracteres."	
					}

				}
			});

			//Fim da validação

		});
