package br.com.ifpe.workfast.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.workfast.model.TipoAcesso;
import br.com.ifpe.workfast.model.TipoAcessoDao;

public class TipoAcessoConverter implements Converter<String, TipoAcesso> {
	
	public TipoAcesso convert(String id) {
		
		TipoAcessoDao dao = new TipoAcessoDao();
			return dao.buscarPorId(Integer.valueOf(id));
		}
}
