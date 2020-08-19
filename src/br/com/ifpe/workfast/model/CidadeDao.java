package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class CidadeDao {

protected static final String PERSISTENCE_UNIT = "workfast";
	
	public void salvar(Cidade obj) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.persist(obj);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	
	public Cidade buscarPorId(int id) {

		Cidade obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Cidade.class, id);
		manager.close();
		factory.close();

		return obj;
	}
	
	public List<Cidade> listar() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		List<Cidade> lista = manager.createQuery("FROM Cidade c ORDER BY c.estado.nome").getResultList();
		manager.close();
		factory.close();
		return lista;
	}
	
	public List<Cidade> filtrarPorEstado(int cod) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Cidade c WHERE c.estado.idEstado = :paramId ORDER BY nome");
		query.setParameter("paramId", cod);
		List<Cidade> lista = query.getResultList();		
		manager.close();
		factory.close();
		return lista;
	}
	
	public void alterar(Cidade cidade) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.merge(cidade);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	

	public void remover(int id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Cidade cidade = manager.find(Cidade.class, id);

		manager.getTransaction().begin();
		manager.remove(cidade);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

}
