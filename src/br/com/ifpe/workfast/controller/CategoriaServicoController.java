package br.com.ifpe.workfast.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ifpe.workfast.model.CategoriaServico;
import br.com.ifpe.workfast.model.CategoriaServicoDao;

@Controller
public class CategoriaServicoController {
  
	@RequestMapping("salvarCategoriaServico")
	public String save(CategoriaServico categoria, Model model) {

		CategoriaServicoDao dao = new CategoriaServicoDao();
		dao.salvar(categoria);

		model.addAttribute("msg", "Categoria incluida com Sucesso");
		return "administrador/cadastroCategoriaServico";
	}


	@RequestMapping("editarCategoriaServico")
	public String edit(@RequestParam("id") Integer id, Model model) {

		CategoriaServicoDao dao = new CategoriaServicoDao();
		CategoriaServico categoria = dao.buscarPorId(id);
		model.addAttribute("categoriaServico", categoria);

		return "administrador/alterarCategoriaServico";
	}

	@RequestMapping("updateCategoriaServico")
	public String update(CategoriaServico categoria, Model model) {

		CategoriaServicoDao dao = new CategoriaServicoDao();
		dao.alterar(categoria);
		model.addAttribute("msg", "Categoria Alterada com Sucesso !");
		
		return "forward:telaCategoriaServico";
	}

	@RequestMapping("deleteCategoriaServico")
	public String delete(@RequestParam("id") Integer id, Model model) {

		CategoriaServicoDao dao = new CategoriaServicoDao();
		dao.remover(id);
		model.addAttribute("msg", "Categoria Removida com Sucesso");
		
		return "forward:telaCategoriaServico";
	}

}
