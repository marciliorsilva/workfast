package br.com.ifpe.workfast.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SistemaController {

	@RequestMapping("colaborador/pagina")
	public String ajuda() {
		return "colaborador/ajudaColaborador";
	}
	
	@RequestMapping("logingmail")
	public String loginGmail() {
		return "login-gmail/logingmail";
	}
}
