package br.com.ifpe.workfast.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ifpe.workfast.model.CategoriaServico;
import br.com.ifpe.workfast.model.CategoriaServicoDao;
import br.com.ifpe.workfast.model.Servico;
import br.com.ifpe.workfast.model.ServicoDao;

@Controller
public class ServicoController {
	
	@RequestMapping("salvarServico")
	public String save(Servico servico, Model model) {

		ServicoDao dao = new ServicoDao();
		dao.salvar(servico);

		model.addAttribute("msg", "Servico incluido com Sucesso");
		return "administrador/cadastroServico";
	}


	@RequestMapping("editarServico")
	public String edit(@RequestParam("id") Integer id, Model model, Model model2) {

		ServicoDao dao = new ServicoDao();
		Servico servico = dao.buscarPorId(id);
		CategoriaServicoDao dao2 = new CategoriaServicoDao();

		List<CategoriaServico> listarCategoriaServico = dao2.listar();
		model2.addAttribute("listarCategoriaServico", listarCategoriaServico);
		
		model.addAttribute("servico", servico);

		return "administrador/alterarServico";
	}

	@RequestMapping("updateServico")
	public String update(Servico servico, Model model) {

		ServicoDao dao = new ServicoDao();
		dao.alterar(servico);
		model.addAttribute("msg", "Servico Alterado com Sucesso !");
		
		return "forward:telaServico";
	}

	@RequestMapping("deleteServico")
	public String delete(@RequestParam("id") Integer id, Model model) {

		ServicoDao dao = new ServicoDao();
		dao.remover(id);
		model.addAttribute("msg", "Servico Removido com Sucesso");
		
		return "forward:telaServico";
	}


}
