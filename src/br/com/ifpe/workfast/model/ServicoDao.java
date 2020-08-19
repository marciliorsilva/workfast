package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class ServicoDao {
	
	
protected static final String PERSISTENCE_UNIT = "workfast";
	
	public void salvar(Servico obj) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.persist(obj);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	
	public Servico buscarPorId(int id) {

		Servico obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Servico.class, id);
		manager.close();
		factory.close();

		return obj;
	}
	
	public List<Servico> listar() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		List<Servico> lista = manager.createQuery("FROM Servico ORDER BY nome").getResultList();
		manager.close();
		factory.close();
		return lista;
	}
	
	public List<Servico> filtrarPorCategoria(int cod) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Servico s WHERE s.categoriaServico.idCategoriaServico = :paramId ORDER BY nome");
		query.setParameter("paramId", cod);
		List<Servico> lista = query.getResultList();		
		manager.close();
		factory.close();
		return lista;
	}
	
	public void alterar(Servico servico) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.merge(servico);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	

	public void remover(int id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Servico servico = manager.find(Servico.class, id);

		manager.getTransaction().begin();
		manager.remove(servico);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}


}
