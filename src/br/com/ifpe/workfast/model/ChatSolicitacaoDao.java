package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

public class ChatSolicitacaoDao {

	protected static final String PERSISTENCE_UNIT = "workfast";
	
	public void publicarMensagem(ChatSolicitacao obj) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.persist(obj);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}
	
	public List<ChatSolicitacao> existeMensagemNova(Integer idPrestador, Integer idCliente, Integer idProposta) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("FROM ChatSolicitacao cs WHERE cs.usuarioPrestador.idUsuario =:paramPrestador AND cs.usuarioCliente.idUsuario =:paramCliente AND cs.solicitacaoContrato.idSolicitacaoContrato =:paramProposta AND cs.novaMensagem =:paramNovo");
		query.setParameter("paramPrestador", idPrestador);
		query.setParameter("paramCliente", idCliente);
		query.setParameter("paramProposta", idProposta);
		query.setParameter("paramNovo","1");
		List<ChatSolicitacao> registros = query.getResultList();
		
		
		manager.close();
		factory.close();
		return registros;
	}
	
	//metodo para listar servicos pendentes aguardando aprovação do prestors na area do cliente
		public List<ChatVO> popularChat(Integer idPrestador, Integer idCliente, Integer idProposta) {

			EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
			EntityManager manager = factory.createEntityManager();
			TypedQuery<ChatVO> query = null;
			
			StringBuilder consulta = new StringBuilder();
			
			consulta.append(" select new br.com.ifpe.workfast.model.ChatVO(");
			
			consulta.append(" sc.idSolicitacaoContrato as idProposta,");
			consulta.append(" cs.usuarioPrestador.idUsuario as idPrestador, ");
			consulta.append(" cs.usuarioCliente.idUsuario as idCliente, ");
			consulta.append(" cs.usuarioCliente.nome as nomeCliente, ");
			consulta.append(" dpCliente.nomeFantasia as nomeFantasiaCliente, ");
			consulta.append(" cs.usuarioPrestador.nome as nomePrestador, ");
			consulta.append(" dpPrestador.nomeFantasia as nomeFantasiaPrestador, ");
			consulta.append(" cs.usuarioPrestador.tipo_usuario as tipoUsuarioPrestador,");
			consulta.append(" cs.usuarioCliente.tipo_usuario as tipoUsuarioCliente,");
			consulta.append(" cs.mensagem as mensagem, ");
			consulta.append(" cs.usuarioPrestador.foto as fotoPrestador, ");
			consulta.append(" cs.enviadoPor as rementente, ");
			consulta.append(" cs.usuarioCliente.foto as fotoCliente) ");
			
						
		    
			consulta.append(" from ChatSolicitacao cs join cs.solicitacaoContrato sc, DadosPessoais dpCliente, DadosPessoais dpPrestador  ");
			consulta.append(" where dpPrestador.usuario = cs.usuarioPrestador AND dpCliente.usuario = cs.usuarioCliente  AND sc.idSolicitacaoContrato = :paramProposta AND cs.usuarioPrestador.idUsuario = :paramPrestador AND cs.usuarioCliente.idUsuario = :paramCliente ");
			query = manager.createQuery(consulta.toString(),ChatVO.class);
			query.setParameter("paramProposta", idProposta);
			query.setParameter("paramCliente", idCliente);
			query.setParameter("paramPrestador", idPrestador);
			  
			List<ChatVO> lista = query.getResultList();
			manager.close();
			factory.close();

			return lista;
		}

}
