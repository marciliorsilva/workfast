package br.com.ifpe.workfast.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.workfast.model.SolicitacaoContrato;
import br.com.ifpe.workfast.model.SolicitacaoContratoDao;

public class SolicitacaoContratoConverter implements Converter<String, SolicitacaoContrato> {
	
    public SolicitacaoContrato convert(String id) {
		
    	SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
			return dao.buscarPorId(Integer.valueOf(id));
		}

}
