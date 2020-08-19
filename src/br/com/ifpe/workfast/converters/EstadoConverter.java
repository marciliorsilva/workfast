package br.com.ifpe.workfast.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.workfast.model.Estado;
import br.com.ifpe.workfast.model.EstadoDao;


public class EstadoConverter implements Converter<String, Estado> {
    public Estado convert(String id) {
		
		EstadoDao dao = new EstadoDao();
		
			return dao.buscarPorId(Integer.valueOf(id));
		}
}
    
