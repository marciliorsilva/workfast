package br.com.ifpe.workfast.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.workfast.model.Profissao;
import br.com.ifpe.workfast.model.ProfissaoDao;

public class ProfissaoConverter implements Converter<String, Profissao> {
      public Profissao convert(String id) {
		
		ProfissaoDao dao = new ProfissaoDao();
			return dao.buscarPorId(Integer.valueOf(id));
		}
}
