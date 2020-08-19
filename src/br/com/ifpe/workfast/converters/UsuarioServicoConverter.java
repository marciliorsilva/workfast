package br.com.ifpe.workfast.converters;

import org.springframework.core.convert.converter.Converter;


import br.com.ifpe.workfast.model.UsuarioServico;
import br.com.ifpe.workfast.model.UsuarioServicoDao;

public class UsuarioServicoConverter implements Converter<String, UsuarioServico> {
    public UsuarioServico convert(String id) {
		
    	UsuarioServicoDao dao = new UsuarioServicoDao();
			return dao.buscarPorId(Integer.valueOf(id));
		} 

}
