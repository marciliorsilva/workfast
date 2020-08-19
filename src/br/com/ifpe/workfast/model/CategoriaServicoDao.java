package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class CategoriaServicoDao {
	
protected static final String PERSISTENCE_UNIT = "workfast";
	
	public void salvar(CategoriaServico obj) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.persist(obj);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	
	public CategoriaServico buscarPorId(int id) {

		CategoriaServico obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(CategoriaServico.class, id);
		manager.close();
		factory.close();

		return obj;
	}
	
	public List<CategoriaServico> listar() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		List<CategoriaServico> lista = manager.createQuery("FROM CategoriaServico ORDER BY nome").getResultList();
		manager.close();
		factory.close();
		return lista;
	}
	
	public void alterar(CategoriaServico categoria) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.merge(categoria);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	

	public void remover(int id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		CategoriaServico categoria = manager.find(CategoriaServico.class, id);

		manager.getTransaction().begin();
		manager.remove(categoria);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}


}
