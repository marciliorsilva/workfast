package br.com.ifpe.workfast.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.workfast.model.Cidade;
import br.com.ifpe.workfast.model.CidadeDao;



public class CidadeConverter implements Converter<String, Cidade> {
    public Cidade convert(String id) {
		
		CidadeDao dao = new CidadeDao();
		
			return dao.buscarPorId(Integer.valueOf(id));
		} 

}
