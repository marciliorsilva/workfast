package br.com.ifpe.workfast.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.workfast.model.CategoriaServico;
import br.com.ifpe.workfast.model.CategoriaServicoDao;

public class CategoriaServicoConverter implements Converter<String, CategoriaServico> {
    public CategoriaServico convert(String id) {
		
    	CategoriaServicoDao dao = new CategoriaServicoDao();
		
			return dao.buscarPorId(Integer.valueOf(id));
		} 


}
