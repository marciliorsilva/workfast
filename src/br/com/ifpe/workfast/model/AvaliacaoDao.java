package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class AvaliacaoDao {
	
	protected static final String PERSISTENCE_UNIT = "workfast";
	
	public void salvar(Avaliacao obj) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.persist(obj);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}
	
	
	public Avaliacao buscarAvalicaoPorId(int idSolicitacao) {

		Avaliacao obj = null;
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Avaliacao a WHERE a.solicitacaoContrato.idSolicitacaoContrato = :paramId");
		query.setParameter("paramId", idSolicitacao);
		
		try {
			obj = (Avaliacao) query.getSingleResult();
		} catch (NoResultException nre) {
			return obj;
		}

		manager.close();
		factory.close();
		return obj;

	}

}
