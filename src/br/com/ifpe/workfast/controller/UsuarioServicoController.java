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
import br.com.ifpe.workfast.model.UsuarioServico;
import br.com.ifpe.workfast.model.UsuarioServicoDao;

@Controller
public class UsuarioServicoController {

	
	public UsuarioServico save(UsuarioServico usuarioServico) {

		UsuarioServicoDao dao = new UsuarioServicoDao();
		UsuarioServico retorno = dao.salvar(usuarioServico);

		
		return retorno;
	}
    
	public boolean existeVinculacao(int idUsuario, int idServico) {

		UsuarioServicoDao dao = new UsuarioServicoDao();
		boolean retorno = dao.existeVinculacao(idUsuario, idServico);

		
		return retorno;
	}

	
	public String edit(@RequestParam("id") Integer id, Model model, Model model2) {

		
		return "";
	}

	
	public void update(UsuarioServico usuarioServico) {
        UsuarioServicoDao dao = new UsuarioServicoDao();
        dao.alterar(usuarioServico);
		
		
	}

	
	public String delete(@RequestParam("id") Integer id, Model model) {

		
		return "";
	}

}
