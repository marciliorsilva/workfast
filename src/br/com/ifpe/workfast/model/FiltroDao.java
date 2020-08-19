package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class FiltroDao {
	
	private static final String PERSISTENCE_UNIT = "workfast";
	
	public List<FiltroPrestadorVO> listarPrestadores(Integer idEstado, Integer idCidade,Integer idCategoria, Integer idServico) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		TypedQuery<FiltroPrestadorVO> query = null;
		
		StringBuilder consulta = new StringBuilder();
		consulta.append(" select new br.com.ifpe.workfast.model.FiltroPrestadorVO(");
		
		consulta.append(" su.servico.nome as nomeServico, ");
		consulta.append(" su.servico.categoriaServico.nome as nomeCategoria, ");
		consulta.append(" su.usuario.nome as nomeUsuario, ");
		consulta.append(" su.usuario.foto as fotoUsuario, ");
		consulta.append(" dp.nomeFantasia as nomeFantasia, ");
		consulta.append(" cid.nome as nomeCidade, ");
		consulta.append(" su.usuario.idUsuario as codUsuario,");
		consulta.append(" su.idUsuarioServico as codUsuarioServico, ");
		consulta.append(" su.usuario.tipo_usuario as tipoUsuario,");
		consulta.append(" su.descricao as descricao )");
		

		consulta.append(" from CidadeAtuacaoServico cas join cas.usuarioServico su join cas.cidade cid, DadosPessoais dp ");
        
		if(idEstado == null && idCidade == null && idCategoria == null && idServico == null) {
        	consulta.append(" where dp.usuario = su.usuario ");
        }else if(idEstado != null && idCidade == null && idCategoria == null && idServico == null ) {
        	consulta.append(" where dp.usuario = su.usuario AND cid.estado.idEstado = "+idEstado+" ");
        	
        }else if(idEstado != null && idCidade != null && idCategoria == null && idServico == null) {
        	consulta.append(" where dp.usuario = su.usuario AND cid.estado.idEstado = "+idEstado+" AND cid.idCidade = "+idCidade+" ");
        	
        }else if(idEstado != null && idCidade != null && idCategoria != null && idServico == null) {
        	consulta.append(" where dp.usuario = su.usuario AND cid.estado.idEstado = "+idEstado+" AND cid.idCidade = "+idCidade+" AND su.servico.categoriaServico.idCategoriaServico = "+idCategoria+" ");
        	
        }else if(idEstado != null && idCidade != null && idCategoria != null && idServico != null) {
        	consulta.append(" where dp.usuario = su.usuario AND cid.estado.idEstado = "+idEstado+" AND cid.idCidade = "+idCidade+" AND su.servico.categoriaServico.idCategoriaServico = "+idCategoria+" AND su.servico.idServico = "+idServico+"");
        	
        }else if(idEstado != null && idCidade != null && idCategoria == null && idServico != null) {
        	consulta.append(" where dp.usuario = su.usuario AND cid.estado.idEstado = "+idEstado+" AND cid.idCidade = "+idCidade+" AND su.servico.idServico = "+idServico+"");
        	
        }else if(idEstado != null && idCidade == null && idCategoria != null && idServico != null) {
        	consulta.append(" where dp.usuario = su.usuario AND cid.estado.idEstado = "+idEstado+" AND su.servico.categoriaServico.idCategoriaServico = "+idCategoria+" AND su.servico.idServico = "+idServico+"");
        	
        }else if(idEstado != null && idCidade == null && idCategoria != null && idServico == null) {
        	consulta.append(" where dp.usuario = su.usuario AND cid.estado.idEstado = "+idEstado+" AND su.servico.categoriaServico.idCategoriaServico = "+idCategoria+" ");
        	
        }else if(idEstado != null && idCidade == null && idCategoria == null && idServico != null) {
        	consulta.append(" where dp.usuario = su.usuario AND cid.estado.idEstado = "+idEstado+" AND su.servico.idServico = "+idServico+" ");
        	
        }else if(idEstado == null && idCidade != null && idCategoria == null && idServico == null) {
        	consulta.append(" where dp.usuario = su.usuario AND cid.idCidade = "+idCidade+" ");
        	
        }else if(idEstado == null && idCidade != null && idCategoria != null && idServico == null) {
        	consulta.append(" where dp.usuario = su.usuario AND cid.idCidade = "+idCidade+" AND su.servico.categoriaServico.idCategoriaServico = "+idCategoria+" ");
        	
        }else if(idEstado == null && idCidade != null && idCategoria != null && idServico != null) {
        	consulta.append(" where dp.usuario = su.usuario AND cid.idCidade = "+idCidade+" AND su.servico.categoriaServico.idCategoriaServico = "+idCategoria+" AND su.servico.idServico = "+idServico+"");
        	
        }else if(idEstado == null && idCidade != null && idCategoria == null && idServico != null) {
        	consulta.append(" where dp.usuario = su.usuario AND cid.idCidade = "+idCidade+" AND su.servico.idServico = "+idServico+"");
        	
        }else if(idEstado == null && idCidade == null && idCategoria != null && idServico == null) {
        	consulta.append(" where dp.usuario = su.usuario AND su.servico.categoriaServico.idCategoriaServico = "+idCategoria+" ");
        	
        }else if(idEstado == null && idCidade == null && idCategoria != null && idServico != null) {
        	consulta.append(" where dp.usuario = su.usuario AND su.servico.categoriaServico.idCategoriaServico = "+idCategoria+" AND su.servico.idServico = "+idServico+"");
        	
        }else if(idEstado == null && idCidade == null && idCategoria == null && idServico != null) {
        	consulta.append(" where dp.usuario = su.usuario AND su.servico.idServico = "+idServico+"");
        	
        }      
		
		
        
		
			
		
		query = manager.createQuery(consulta.toString(),FiltroPrestadorVO.class);
		//query.setParameter("paramId", "");
		List<FiltroPrestadorVO> lista = query.getResultList();
		manager.close();
		factory.close();

		return lista;
	}

}
