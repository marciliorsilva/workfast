package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EstadoDao {

	protected static final String PERSISTENCE_UNIT = "workfast";
	
	public void salvar(Estado obj) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.persist(obj);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	
	public Estado buscarPorId(int id) {

		Estado obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Estado.class, id);
		manager.close();
		factory.close();

		return obj;
	}
	
	public List<Estado> listar() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		List<Estado> lista = manager.createQuery("FROM Estado ORDER BY nome").getResultList();
		manager.close();
		factory.close();
		return lista;
	}
	
	public void alterar(Estado estado) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.merge(estado);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	

	public void remover(int id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Estado estado = manager.find(Estado.class, id);

		manager.getTransaction().begin();
		manager.remove(estado);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}
}
