package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

public class SolicitacaoContratoDao {

	protected static final String PERSISTENCE_UNIT = "workfast";

	public void salvar(SolicitacaoContrato obj) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.persist(obj);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	public SolicitacaoContrato buscarPorId(int idSolicitacao) {

		SolicitacaoContrato obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(SolicitacaoContrato.class, idSolicitacao);
		manager.close();
		factory.close();

		return obj;
	}

	public SolicitacaoContrato existeVinculacao(int idUsuario, int idUsuarioServico, int idEndereco) {

		SolicitacaoContrato obj = null;
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery(
				"FROM SolicitacaoContrato sc WHERE sc.usuario.idUsuario =:paramUsuario AND sc.usuarioServico.idUsuarioServico =:paramUsuarioServico AND sc.endereco.id =:paramEndereco AND sc.status = '1' OR sc.status = '3' ");
		query.setParameter("paramUsuario", idUsuario);
		query.setParameter("paramUsuarioServico", idUsuarioServico);
		query.setParameter("paramEndereco", idEndereco);

		try {
			obj = (SolicitacaoContrato) query.getSingleResult();
		} catch (NoResultException nre) {
			return obj;
		}

		manager.close();
		factory.close();
		return obj;

	}

	// metodo para retornar um objeto da proposta e que esta aguardando aprovacao do
	// prestador
	// esse metodo vai listar as informções do cliente no primeiro estagio na area
	// do prestador
	public ListaPedidosPendentesVO buscarPedidoPendentePrestador(Integer id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		TypedQuery<ListaPedidosPendentesVO> query = null;

		StringBuilder consulta = new StringBuilder();

		consulta.append(" select new br.com.ifpe.workfast.model.ListaPedidosPendentesVO(");

		consulta.append(" sc.idSolicitacaoContrato as idProposta,");
		consulta.append(" us.usuario.idUsuario as idPrestador, ");
		consulta.append(" sc.usuario.idUsuario as idCliente, ");
		consulta.append(" us.usuario.nome as nomeCliente, ");
		consulta.append(" dp.nomeFantasia as nomeFantasia, ");
		consulta.append(" us.usuario.tipo_usuario as tipoUsuario,");
		consulta.append(" us.servico.nome as nomeServico, ");
		consulta.append(" ed.rua as endereco, ");
		consulta.append(" ed.numeroCasa as numeroCasa, ");
		consulta.append(" ed.cep as cep, ");
		consulta.append(" ed.cidade.nome as cidade, ");
		consulta.append(" ed.estado.nome as estado, ");
		consulta.append(" sc.convite as proposta, ");
		consulta.append(" sc.mensagem as mensagem, ");
		consulta.append(" ed.bairro as bairro, ");
		consulta.append(" ed.complemento as complemento, ");
		consulta.append(" sc.usuario.foto as foto, ");
		consulta.append(" sc.estagio as estagio, ");
		consulta.append(" sc.status as status ) ");

		consulta.append(
				" from SolicitacaoContrato sc join sc.usuarioServico us join sc.endereco ed,  DadosPessoais dp ");
		consulta.append(
				" where dp.usuario = us.usuario AND ed.usuario = sc.usuario AND sc.status = :paramStatus AND (sc.estagio = :paramEstagio1 OR (sc.estagio = :paramEstagio2 OR sc.estagio = :paramEstagio3) ) AND sc.idSolicitacaoContrato = :paramId");
		query = manager.createQuery(consulta.toString(), ListaPedidosPendentesVO.class);
		query.setParameter("paramId", id);
		query.setParameter("paramStatus", "1");
		query.setParameter("paramEstagio1", "1");
		query.setParameter("paramEstagio2", "2");
		query.setParameter("paramEstagio3", "3");
		List<ListaPedidosPendentesVO> registros = query.getResultList();

		ListaPedidosPendentesVO obj = null;

		if (!registros.isEmpty()) {
			obj = (ListaPedidosPendentesVO) registros.get(0);
		}

		manager.close();
		factory.close();
		return obj;

	}

	// metodo para retornar um objeto da proposta e que esta aguardando aprovacao do
	// prestador
	// esse metodo vai listar as informções do cliente no primeiro estagio na area
	// do prestador
	public ListaPedidosPendentesVO buscarPedidoPendente(Integer id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		TypedQuery<ListaPedidosPendentesVO> query = null;

		StringBuilder consulta = new StringBuilder();

		consulta.append(" select new br.com.ifpe.workfast.model.ListaPedidosPendentesVO(");

		consulta.append(" sc.idSolicitacaoContrato as idProposta,");
		consulta.append(" us.usuario.idUsuario as idPrestador, ");
		consulta.append(" sc.usuario.idUsuario as idCliente, ");
		consulta.append(" sc.usuario.nome as nomeCliente, ");
		consulta.append(" dp.nomeFantasia as nomeFantasia, ");
		consulta.append(" sc.usuario.tipo_usuario as tipoUsuario,");
		consulta.append(" us.servico.nome as nomeServico, ");
		consulta.append(" ed.rua as endereco, ");
		consulta.append(" ed.numeroCasa as numeroCasa, ");
		consulta.append(" ed.cep as cep, ");
		consulta.append(" ed.cidade.nome as cidade, ");
		consulta.append(" ed.estado.nome as estado, ");
		consulta.append(" sc.convite as proposta, ");
		consulta.append(" sc.mensagem as mensagem, ");
		consulta.append(" ed.bairro as bairro, ");
		consulta.append(" ed.complemento as complemento, ");
		consulta.append(" sc.usuario.foto as foto, ");
		consulta.append(" sc.estagio as estagio, ");

		consulta.append(" sc.status as status ) ");

		consulta.append(
				" from SolicitacaoContrato sc join sc.usuarioServico us join sc.endereco ed,  DadosPessoais dp ");
		consulta.append(
				" where dp.usuario = sc.usuario AND ed.usuario = sc.usuario AND sc.status = :paramStatus AND (sc.estagio = :paramEstagio1 OR (sc.estagio = :paramEstagio2 OR sc.estagio = :paramEstagio3) ) AND sc.idSolicitacaoContrato = :paramId");
		query = manager.createQuery(consulta.toString(), ListaPedidosPendentesVO.class);
		query.setParameter("paramId", id);
		query.setParameter("paramStatus", "1");
		query.setParameter("paramEstagio1", "1");
		query.setParameter("paramEstagio2", "2");
		query.setParameter("paramEstagio3", "3");
		List<ListaPedidosPendentesVO> registros = query.getResultList();

		ListaPedidosPendentesVO obj = null;

		if (!registros.isEmpty()) {
			obj = (ListaPedidosPendentesVO) registros.get(0);
		}

		manager.close();
		factory.close();
		return obj;

	}

	// metodo para listar servicos pendentes aguardando aprovação do prestors na
	// area do cliente
	public List<ListaPedidosPendentesVO> listarPedidosPendentesCliente(Integer id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		TypedQuery<ListaPedidosPendentesVO> query = null;

		StringBuilder consulta = new StringBuilder();

		consulta.append(" select new br.com.ifpe.workfast.model.ListaPedidosPendentesVO(");
		consulta.append(" sc.idSolicitacaoContrato as idProposta,");
		consulta.append(" us.usuario.idUsuario as idPrestador, ");
		consulta.append(" sc.usuario.idUsuario as idCliente, ");
		consulta.append(" us.usuario.nome as nomePrestador, ");
		consulta.append(" dp.nomeFantasia as nomeFantasia, ");
		consulta.append(" sc.usuario.tipo_usuario as tipoUsuario,");
		consulta.append(" us.servico.nome as nomeServico, ");
		consulta.append(" ed.rua as endereco, ");
		consulta.append(" ed.numeroCasa as numeroCasa, ");
		consulta.append(" ed.cep as cep, ");
		consulta.append(" ed.cidade.nome as cidade, ");
		consulta.append(" ed.estado.nome as estado, ");
		consulta.append(" sc.convite as proposta, ");
		consulta.append(" sc.mensagem as mensagem, ");
		consulta.append(" ed.bairro as bairro, ");
		consulta.append(" ed.complemento as complemento, ");
		consulta.append(" sc.usuario.foto as foto, ");
		consulta.append(" sc.estagio as estagio, ");
		consulta.append(" sc.status as status ) ");

		consulta.append(
				" from SolicitacaoContrato sc join sc.usuarioServico us join sc.endereco ed,  DadosPessoais dp ");
		consulta.append(
				" where dp.usuario = us.usuario AND sc.status = :paramStatus AND (sc.estagio = :paramEstagio1 OR (sc.estagio = :paramEstagio2 OR sc.estagio = :paramEstagio3) ) AND sc.usuario.idUsuario = :paramId");
		query = manager.createQuery(consulta.toString(), ListaPedidosPendentesVO.class);
		query.setParameter("paramId", id);
		query.setParameter("paramStatus", "1");
		query.setParameter("paramEstagio1", "1");
		query.setParameter("paramEstagio2", "2");
		query.setParameter("paramEstagio3", "3");
		List<ListaPedidosPendentesVO> lista = query.getResultList();
		manager.close();
		factory.close();

		return lista;
	}

	// metodo para listar servicos em andamento na area do cliente
	public List<ListaPedidosPendentesVO> listarPedidosAndamentosCliente(Integer id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		TypedQuery<ListaPedidosPendentesVO> query = null;

		StringBuilder consulta = new StringBuilder();

		consulta.append(" select new br.com.ifpe.workfast.model.ListaPedidosPendentesVO(");

		consulta.append(" sc.idSolicitacaoContrato as idProposta,");
		consulta.append(" us.usuario.idUsuario as idPrestador, ");
		consulta.append(" sc.usuario.idUsuario as idCliente, ");
		consulta.append(" sc.usuario.nome as nomeCliente, ");
		consulta.append(" dp.nomeFantasia as nomeFantasia, ");
		consulta.append(" sc.usuario.tipo_usuario as tipoUsuario,");
		consulta.append(" us.servico.nome as nomeServico, ");
		consulta.append(" ed.rua as endereco, ");
		consulta.append(" ed.numeroCasa as numeroCasa, ");
		consulta.append(" ed.cep as cep, ");
		consulta.append(" ed.cidade.nome as cidade, ");
		consulta.append(" ed.estado.nome as estado, ");
		consulta.append(" sc.convite as proposta, ");
		consulta.append(" sc.mensagem as mensagem, ");
		consulta.append(" ed.bairro as bairro, ");
		consulta.append(" ed.complemento as complemento, ");
		consulta.append(" sc.usuario.foto as foto, ");
		consulta.append(" sc.estagio as estagio, ");
		consulta.append(" sc.status as status ) ");

		consulta.append(
				" from SolicitacaoContrato sc join sc.usuarioServico us join sc.endereco ed,  DadosPessoais dp ");
		consulta.append(
				" where dp.usuario = us.usuario AND ed.usuario = sc.usuario AND sc.status = :paramStatus AND sc.estagio = :paramEstagio1  AND sc.usuario.idUsuario = :paramId");
		query = manager.createQuery(consulta.toString(), ListaPedidosPendentesVO.class);
		query.setParameter("paramId", id);
		query.setParameter("paramStatus", "3");
		query.setParameter("paramEstagio1", "4");

		List<ListaPedidosPendentesVO> lista = query.getResultList();
		manager.close();
		factory.close();

		return lista;
	}

	// metodo para listar servicos fnalizados na area do cliente
	public List<ListaPedidosPendentesVO> listarPedidosFinalizadosCliente(Integer id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		TypedQuery<ListaPedidosPendentesVO> query = null;

		StringBuilder consulta = new StringBuilder();

		consulta.append(" select new br.com.ifpe.workfast.model.ListaPedidosPendentesVO(");

		consulta.append(" sc.idSolicitacaoContrato as idProposta,");
		consulta.append(" us.usuario.idUsuario as idPrestador, ");
		consulta.append(" sc.usuario.idUsuario as idCliente, ");
		consulta.append(" sc.usuario.nome as nomeCliente, ");
		consulta.append(" dp.nomeFantasia as nomeFantasia, ");
		consulta.append(" sc.usuario.tipo_usuario as tipoUsuario,");
		consulta.append(" us.servico.nome as nomeServico, ");
		consulta.append(" ed.rua as endereco, ");
		consulta.append(" ed.numeroCasa as numeroCasa, ");
		consulta.append(" ed.cep as cep, ");
		consulta.append(" ed.cidade.nome as cidade, ");
		consulta.append(" ed.estado.nome as estado, ");
		consulta.append(" sc.convite as proposta, ");
		consulta.append(" sc.mensagem as mensagem, ");
		consulta.append(" ed.bairro as bairro, ");
		consulta.append(" ed.complemento as complemento, ");
		consulta.append(" sc.usuario.foto as foto, ");
		consulta.append(" sc.estagio as estagio, ");
		consulta.append(" sc.status as status ) ");

		consulta.append(
				" from SolicitacaoContrato sc join sc.usuarioServico us join sc.endereco ed,  DadosPessoais dp ");
		consulta.append(
				" where dp.usuario = us.usuario AND ed.usuario = sc.usuario AND sc.status = :paramStatus AND sc.estagio = :paramEstagio1  AND sc.usuario.idUsuario = :paramId");
		query = manager.createQuery(consulta.toString(), ListaPedidosPendentesVO.class);
		query.setParameter("paramId", id);
		query.setParameter("paramStatus", "2");
		query.setParameter("paramEstagio1", "5");

		List<ListaPedidosPendentesVO> lista = query.getResultList();
		manager.close();
		factory.close();

		return lista;
	}

	// metodo para listar servicos fnalizados na area do cliente
	public List<ListaPedidosPendentesVO> listarPedidosCanceladosCliente(Integer id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		TypedQuery<ListaPedidosPendentesVO> query = null;

		StringBuilder consulta = new StringBuilder();

		consulta.append(" select new br.com.ifpe.workfast.model.ListaPedidosPendentesVO(");

		consulta.append(" sc.idSolicitacaoContrato as idProposta,");
		consulta.append(" us.usuario.idUsuario as idPrestador, ");
		consulta.append(" sc.usuario.idUsuario as idCliente, ");
		consulta.append(" sc.usuario.nome as nomeCliente, ");
		consulta.append(" dp.nomeFantasia as nomeFantasia, ");
		consulta.append(" sc.usuario.tipo_usuario as tipoUsuario,");
		consulta.append(" us.servico.nome as nomeServico, ");
		consulta.append(" ed.rua as endereco, ");
		consulta.append(" ed.numeroCasa as numeroCasa, ");
		consulta.append(" ed.cep as cep, ");
		consulta.append(" ed.cidade.nome as cidade, ");
		consulta.append(" ed.estado.nome as estado, ");
		consulta.append(" sc.convite as proposta, ");
		consulta.append(" sc.mensagem as mensagem, ");
		consulta.append(" ed.bairro as bairro, ");
		consulta.append(" ed.complemento as complemento, ");
		consulta.append(" sc.usuario.foto as foto, ");
		consulta.append(" sc.estagio as estagio, ");
		consulta.append(" sc.status as status ) ");

		consulta.append(
				" from SolicitacaoContrato sc join sc.usuarioServico us join sc.endereco ed,  DadosPessoais dp ");
		consulta.append(
				" where dp.usuario = us.usuario AND ed.usuario = sc.usuario AND sc.status = :paramStatus AND sc.estagio = :paramEstagio1  AND sc.usuario.idUsuario = :paramId");
		query = manager.createQuery(consulta.toString(), ListaPedidosPendentesVO.class);
		query.setParameter("paramId", id);
		query.setParameter("paramStatus", "0");
		query.setParameter("paramEstagio1", "0");

		List<ListaPedidosPendentesVO> lista = query.getResultList();
		manager.close();
		factory.close();

		return lista;
	}

	// metodo para listar pedidos de servicos do cliente na index prestdor
	public List<ListaPedidosPendentesVO> listarPedidosPrestador(Integer id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		TypedQuery<ListaPedidosPendentesVO> query = null;

		StringBuilder consulta = new StringBuilder();

		consulta.append(" select new br.com.ifpe.workfast.model.ListaPedidosPendentesVO(");

		consulta.append(" sc.idSolicitacaoContrato as idProposta,");
		consulta.append(" us.usuario.idUsuario as idPrestador, ");
		consulta.append(" sc.usuario.idUsuario as idCliente, ");
		consulta.append(" sc.usuario.nome as nomeCliente, ");
		consulta.append(" dp.nomeFantasia as nomeFantasia, ");
		consulta.append(" sc.usuario.tipo_usuario as tipoUsuario,");
		consulta.append(" us.servico.nome as nomeServico, ");
		consulta.append(" ed.rua as endereco, ");
		consulta.append(" ed.numeroCasa as numeroCasa, ");
		consulta.append(" ed.cep as cep, ");
		consulta.append(" ed.cidade.nome as cidade, ");
		consulta.append(" ed.estado.nome as estado, ");
		consulta.append(" sc.convite as proposta, ");
		consulta.append(" sc.mensagem as mensagem, ");
		consulta.append(" ed.bairro as bairro, ");
		consulta.append(" ed.complemento as complemento, ");
		consulta.append(" sc.usuario.foto as foto, ");
		consulta.append(" sc.estagio as estagio, ");
		consulta.append(" sc.status as status ) ");

		consulta.append(
				" from SolicitacaoContrato sc join sc.usuarioServico us join sc.endereco ed,  DadosPessoais dp ");
		consulta.append(
				" where dp.usuario = sc.usuario AND sc.usuario = ed.usuario AND sc.status = :paramStatus AND sc.estagio = :paramEstagio AND sc.usuarioServico.usuario.idUsuario = :paramId");
		query = manager.createQuery(consulta.toString(), ListaPedidosPendentesVO.class);
		query.setParameter("paramId", id);
		query.setParameter("paramStatus", "1");
		query.setParameter("paramEstagio", "1");
		List<ListaPedidosPendentesVO> lista = query.getResultList();
		manager.close();
		factory.close();

		return lista;
	}

	// metodo para listar pedidos de servicos em abertos na area do prestador |
	// status = 1/estagio = 2 e status = 1/estagio = 3 ==> em aberto
	public List<ListaPedidosPendentesVO> listarPedidosPrestadorEmAberto(Integer id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		TypedQuery<ListaPedidosPendentesVO> query = null;

		StringBuilder consulta = new StringBuilder();

		consulta.append(" select new br.com.ifpe.workfast.model.ListaPedidosPendentesVO(");

		consulta.append(" sc.idSolicitacaoContrato as idProposta,");
		consulta.append(" us.usuario.idUsuario as idPrestador, ");
		consulta.append(" sc.usuario.idUsuario as idCliente, ");
		consulta.append(" sc.usuario.nome as nomeCliente, ");
		consulta.append(" dp.nomeFantasia as nomeFantasia, ");
		consulta.append(" sc.usuario.tipo_usuario as tipoUsuario,");
		consulta.append(" us.servico.nome as nomeServico, ");
		consulta.append(" ed.rua as endereco, ");
		consulta.append(" ed.numeroCasa as numeroCasa, ");
		consulta.append(" ed.cep as cep, ");
		consulta.append(" ed.cidade.nome as cidade, ");
		consulta.append(" ed.estado.nome as estado, ");
		consulta.append(" sc.convite as proposta, ");
		consulta.append(" sc.mensagem as mensagem, ");
		consulta.append(" ed.bairro as bairro, ");
		consulta.append(" ed.complemento as complemento, ");
		consulta.append(" sc.usuario.foto as foto, ");
		consulta.append(" sc.estagio as estagio, ");
		consulta.append(" sc.status as status ) ");

		consulta.append(
				" from SolicitacaoContrato sc join sc.usuarioServico us join sc.endereco ed,  DadosPessoais dp ");
		consulta.append(
				" where dp.usuario = sc.usuario AND ed.usuario = sc.usuario AND sc.status = :paramStatus1 AND (sc.estagio = :paramEstagio1 OR sc.estagio = :paramEstagio2) AND sc.usuarioServico.usuario.idUsuario = :paramId");
		query = manager.createQuery(consulta.toString(), ListaPedidosPendentesVO.class);
		query.setParameter("paramId", id);
		query.setParameter("paramStatus1", "1");
		query.setParameter("paramEstagio1", "2");
		query.setParameter("paramEstagio2", "3");
		List<ListaPedidosPendentesVO> lista = query.getResultList();
		manager.close();
		factory.close();

		return lista;
	}

	// metodo para listar pedidos de servicos em abertos na area do prestador |
	// status = 3/estagio = 4 ==> em andamento
	public List<ListaPedidosPendentesVO> listarPedidosPrestadorEmAndamento(Integer id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		TypedQuery<ListaPedidosPendentesVO> query = null;

		StringBuilder consulta = new StringBuilder();

		consulta.append(" select new br.com.ifpe.workfast.model.ListaPedidosPendentesVO(");

		consulta.append(" sc.idSolicitacaoContrato as idProposta,");
		consulta.append(" us.usuario.idUsuario as idPrestador, ");
		consulta.append(" sc.usuario.idUsuario as idCliente, ");
		consulta.append(" sc.usuario.nome as nomeCliente, ");
		consulta.append(" dp.nomeFantasia as nomeFantasia, ");
		consulta.append(" sc.usuario.tipo_usuario as tipoUsuario,");
		consulta.append(" us.servico.nome as nomeServico, ");
		consulta.append(" ed.rua as endereco, ");
		consulta.append(" ed.numeroCasa as numeroCasa, ");
		consulta.append(" ed.cep as cep, ");
		consulta.append(" ed.cidade.nome as cidade, ");
		consulta.append(" ed.estado.nome as estado, ");
		consulta.append(" sc.convite as proposta, ");
		consulta.append(" sc.mensagem as mensagem, ");
		consulta.append(" ed.bairro as bairro, ");
		consulta.append(" ed.complemento as complemento, ");
		consulta.append(" sc.usuario.foto as foto, ");
		consulta.append(" sc.estagio as estagio, ");
		consulta.append(" sc.status as status ) ");

		consulta.append(
				" from SolicitacaoContrato sc join sc.usuarioServico us join sc.endereco ed,  DadosPessoais dp ");
		consulta.append(
				" where dp.usuario = sc.usuario AND ed.usuario = sc.usuario AND sc.status = :paramStatus1 AND sc.estagio = :paramEstagio1  AND sc.usuarioServico.usuario.idUsuario = :paramId");
		query = manager.createQuery(consulta.toString(), ListaPedidosPendentesVO.class);
		query.setParameter("paramId", id);
		query.setParameter("paramStatus1", "3");
		query.setParameter("paramEstagio1", "4");

		List<ListaPedidosPendentesVO> lista = query.getResultList();
		manager.close();
		factory.close();

		return lista;
	}

	// metodo para listar pedidos de servicos em abertos na area do prestador |
	// status = 3/estagio = 4 ==> em andamento
	public List<ListaPedidosPendentesVO> listarPedidosPrestadorEmFinalizado(Integer id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		TypedQuery<ListaPedidosPendentesVO> query = null;

		StringBuilder consulta = new StringBuilder();

		consulta.append(" select new br.com.ifpe.workfast.model.ListaPedidosPendentesVO(");

		consulta.append(" sc.idSolicitacaoContrato as idProposta,");
		consulta.append(" us.usuario.idUsuario as idPrestador, ");
		consulta.append(" sc.usuario.idUsuario as idCliente, ");
		consulta.append(" sc.usuario.nome as nomeCliente, ");
		consulta.append(" dp.nomeFantasia as nomeFantasia, ");
		consulta.append(" sc.usuario.tipo_usuario as tipoUsuario,");
		consulta.append(" us.servico.nome as nomeServico, ");
		consulta.append(" ed.rua as endereco, ");
		consulta.append(" ed.numeroCasa as numeroCasa, ");
		consulta.append(" ed.cep as cep, ");
		consulta.append(" ed.cidade.nome as cidade, ");
		consulta.append(" ed.estado.nome as estado, ");
		consulta.append(" sc.convite as proposta, ");
		consulta.append(" sc.mensagem as mensagem, ");
		consulta.append(" ed.bairro as bairro, ");
		consulta.append(" ed.complemento as complemento, ");
		consulta.append(" sc.usuario.foto as foto, ");
		consulta.append(" sc.estagio as estagio, ");
		consulta.append(" sc.status as status ) ");

		consulta.append(
				" from SolicitacaoContrato sc join sc.usuarioServico us join sc.endereco ed,  DadosPessoais dp ");
		consulta.append(
				" where dp.usuario = sc.usuario AND ed.usuario = sc.usuario AND sc.status = :paramStatus AND sc.estagio = :paramEstagio1  AND sc.usuarioServico.usuario.idUsuario = :paramId");
		query = manager.createQuery(consulta.toString(), ListaPedidosPendentesVO.class);
		query.setParameter("paramId", id);
		query.setParameter("paramStatus", "2");
		query.setParameter("paramEstagio1", "5");

		List<ListaPedidosPendentesVO> lista = query.getResultList();
		manager.close();
		factory.close();

		return lista;
	}
	
	// metodo para listar pedidos de servicos em abertos na area do prestador |
		// status = 3/estagio = 4 ==> em andamento
		public List<ListaPedidosPendentesVO> listarPedidosPrestadorEmCancelado(Integer id) {

			EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
			EntityManager manager = factory.createEntityManager();
			TypedQuery<ListaPedidosPendentesVO> query = null;

			StringBuilder consulta = new StringBuilder();

			consulta.append(" select new br.com.ifpe.workfast.model.ListaPedidosPendentesVO(");

			consulta.append(" sc.idSolicitacaoContrato as idProposta,");
			consulta.append(" us.usuario.idUsuario as idPrestador, ");
			consulta.append(" sc.usuario.idUsuario as idCliente, ");
			consulta.append(" sc.usuario.nome as nomeCliente, ");
			consulta.append(" dp.nomeFantasia as nomeFantasia, ");
			consulta.append(" sc.usuario.tipo_usuario as tipoUsuario,");
			consulta.append(" us.servico.nome as nomeServico, ");
			consulta.append(" ed.rua as endereco, ");
			consulta.append(" ed.numeroCasa as numeroCasa, ");
			consulta.append(" ed.cep as cep, ");
			consulta.append(" ed.cidade.nome as cidade, ");
			consulta.append(" ed.estado.nome as estado, ");
			consulta.append(" sc.convite as proposta, ");
			consulta.append(" sc.mensagem as mensagem, ");
			consulta.append(" ed.bairro as bairro, ");
			consulta.append(" ed.complemento as complemento, ");
			consulta.append(" sc.usuario.foto as foto, ");
			consulta.append(" sc.estagio as estagio, ");
			consulta.append(" sc.status as status ) ");

			consulta.append(
					" from SolicitacaoContrato sc join sc.usuarioServico us join sc.endereco ed,  DadosPessoais dp ");
			consulta.append(
					" where dp.usuario = sc.usuario AND ed.usuario = sc.usuario AND sc.status = :paramStatus AND sc.estagio = :paramEstagio1  AND sc.usuarioServico.usuario.idUsuario = :paramId");
			query = manager.createQuery(consulta.toString(), ListaPedidosPendentesVO.class);
			query.setParameter("paramId", id);
			query.setParameter("paramStatus", "0");
			query.setParameter("paramEstagio1", "0");

			List<ListaPedidosPendentesVO> lista = query.getResultList();
			manager.close();
			factory.close();

			return lista;
		}

	public void update(SolicitacaoContrato obj) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.merge(obj);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

}
