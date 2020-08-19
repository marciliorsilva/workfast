package br.com.ifpe.workfast.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class ContratoDao {

	protected static final String PERSISTENCE_UNIT = "workfast";

	public void salvar(Contrato obj) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();

		manager.persist(obj);
		manager.getTransaction().commit();

		manager.close();
		factory.close();

	}

	public Contrato buscarPorId(int id) {

		Contrato obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Contrato.class, id);
		manager.close();
		factory.close();

		return obj;
	}

	public Contrato buscarContratoPorSolicitacao(int id) {

		Contrato obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Contrato c WHERE c.solicitacao.idSolicitacaoContrato = :paramId");
		query.setParameter("paramId", id);

		try {
			obj = (Contrato) query.getSingleResult();
		} catch (NoResultException nre) {
			return null;
		}

		manager.close();
		factory.close();
		return obj;
	}

	public Contrato aceitouContrato(int id) {

		Contrato obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery(
				"FROM Contrato c WHERE c.aceito = :paramAceitou AND c.solicitacao.idSolicitacaoContrato = :paramId");
		query.setParameter("paramId", id);
		query.setParameter("paramAceitou", "1");

		try {
			obj = (Contrato) query.getSingleResult();
		} catch (NoResultException nre) {
			return null;
		}

		manager.close();
		factory.close();
		return obj;
	}

	// Método para buscar verificar se o codigo do contrato já existe no banco de
	// dados
	public Contrato buscarCodigoContrato(String codigo) {

		Contrato obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Contrato WHERE codigoContrato = :paramCodigo");
		query.setParameter("paramCodigo", codigo);

		try {
			obj = (Contrato) query.getSingleResult();
		} catch (NoResultException nre) {
			return null;
		}

		manager.close();
		factory.close();
		return obj;

	}
	
	public void alterar(Contrato contrato) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.merge(contrato);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	public void removerContratoPorSolicitacao(int idContrato) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Contrato contrato = manager.find(Contrato.class, idContrato);

		manager.getTransaction().begin();
		manager.remove(contrato);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
		
	}
}
