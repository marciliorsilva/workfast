package br.com.ifpe.workfast.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ifpe.workfast.model.Profissao;
import br.com.ifpe.workfast.model.ProfissaoDao;

@Controller
public class ProfissaoController {
	
	@RequestMapping("salvarProfissao")
	public String save(Profissao profissao, Model model) {

		ProfissaoDao dao = new ProfissaoDao();
		dao.salvar(profissao);

		model.addAttribute("msg", "Profissao incluida com Sucesso");
		return "administrador/cadastroProfissao";
	}


	@RequestMapping("editarProfissao")
	public String edit(@RequestParam("id") Integer id, Model model) {

		ProfissaoDao dao = new ProfissaoDao();
		Profissao profissao = dao.buscarPorId(id);
		model.addAttribute("profissao", profissao);

		return "administrador/alterarProfissao";
	}

	@RequestMapping("updateProfissao")
	public String update(Profissao profissao, Model model) {

		ProfissaoDao dao = new ProfissaoDao();
		dao.alterar(profissao);
		model.addAttribute("msg", "Profissao Alterada com Sucesso !");
		
		return "forward:telaProfissao";
	}

	@RequestMapping("deleteProfissao")
	public String delete(@RequestParam("id") Integer id, Model model) {

		ProfissaoDao dao = new ProfissaoDao();
		dao.remover(id);
		model.addAttribute("msg", "Profissao Removida com Sucesso");
		
		return "forward:telaProfissao";
	}


}
