package br.com.ifpe.workfast.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.workfast.model.Usuario;
import br.com.ifpe.workfast.model.UsuarioDao;


public class UsuarioConverter implements Converter<String, Usuario> {

	public Usuario convert(String id) {
		
		UsuarioDao dao = new UsuarioDao();
			return dao.buscarPorId(Integer.valueOf(id));
		}
}
