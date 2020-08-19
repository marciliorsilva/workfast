package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class PendenciasDao {

	protected static final String PERSISTENCE_UNIT = "workfast";

	public void salvar(Pendencias obj) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.persist(obj);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}
	

	
	// Listar Pendencias para o prestador
	public List<Pendencias> listar() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		List<Pendencias> lista = manager.createQuery("FROM Pendencias ORDER BY dataPostagem").getResultList();
		manager.close();
		factory.close();
		return lista;
	}
	
	public List<Pendencias> buscarPendencias(int idSolicitacao) {


		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		
		query = manager.createQuery("FROM Pendencias WHERE solicitacaoContrato.idSolicitacaoContrato = :paramId");
		query.setParameter("paramId", idSolicitacao);

		
		List<Pendencias> lista = query.getResultList();
		manager.close();
		factory.close();
		
		return lista;

	}

	public void remover(int id) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Pendencias pendencia = manager.find(Pendencias.class, id);
		manager.getTransaction().begin();
		manager.remove(pendencia);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

}
