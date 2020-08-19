package br.com.ifpe.workfast.controller;


import java.util.List;

import org.springframework.stereotype.Controller;

import br.com.ifpe.workfast.model.Cidade;
import br.com.ifpe.workfast.model.CidadeAtuacaoServico;
import br.com.ifpe.workfast.model.CidadeAtuacaoServicoDao;

@Controller
public class CidadeAtuacaoServicoController {

	
	public void save(CidadeAtuacaoServico cidadeAtuacao, List<Cidade> cidades) {

		CidadeAtuacaoServicoDao dao = new CidadeAtuacaoServicoDao();
		
		dao.salvar(cidadeAtuacao, cidades);
		
		
		
	}
}
