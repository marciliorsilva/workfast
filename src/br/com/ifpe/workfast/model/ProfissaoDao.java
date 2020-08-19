package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ProfissaoDao {
	protected static final String PERSISTENCE_UNIT = "workfast";

	public void salvar(Profissao obj) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.persist(obj);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	public List<Profissao> listar() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		List<Profissao> lista = manager.createQuery("FROM Profissao ORDER BY nome").getResultList();
		manager.close();
		factory.close();
		return lista;
	}
	
	public Profissao buscarPorId(int id) {

		Profissao obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Profissao.class, id);
		manager.close();
		factory.close();

		return obj;
	}

	public void alterar(Profissao profissao) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.merge(profissao);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	

	public void remover(int id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Profissao profissao = manager.find(Profissao.class, id);

		manager.getTransaction().begin();
		manager.remove(profissao);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

}
