package br.com.ifpe.workfast.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.workfast.model.Servico;
import br.com.ifpe.workfast.model.ServicoDao;


public class ServicoConverter implements Converter<String, Servico> {
    public Servico convert(String id) {
		
		ServicoDao dao = new ServicoDao();
			return dao.buscarPorId(Integer.valueOf(id));
		}

}
