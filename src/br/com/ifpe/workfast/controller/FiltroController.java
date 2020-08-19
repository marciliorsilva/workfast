package br.com.ifpe.workfast.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import br.com.ifpe.workfast.model.FiltroDao;
import br.com.ifpe.workfast.model.FiltroPrestadorVO;

@Controller	
public class FiltroController {
	
	@RequestMapping(value = "listarFiltro", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String listarTodosFiltro(@RequestParam("idEstado") Integer idEstado,
			@RequestParam("idCidade") Integer idCidade,@RequestParam("idCategoria") Integer idCategoria,
			@RequestParam("idServico") Integer idServico) {
		
		FiltroDao daoFiltro = new FiltroDao();
		List<FiltroPrestadorVO> listar = daoFiltro.listarPrestadores(idEstado,idCidade,idCategoria,idServico);
				
		return new Gson().toJson(listar);
	}
	

}
