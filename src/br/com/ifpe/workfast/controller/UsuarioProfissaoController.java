package br.com.ifpe.workfast.controller;


import br.com.ifpe.workfast.model.UsuarioProfissao;
import br.com.ifpe.workfast.model.UsuarioProfissaoDao;

public class UsuarioProfissaoController {

	
  public Integer save(UsuarioProfissao usuarioProfissao) {
				
	 UsuarioProfissaoDao dao = new UsuarioProfissaoDao();
	 dao.salvar(usuarioProfissao);
				
	 return 1;
  }
  
}
