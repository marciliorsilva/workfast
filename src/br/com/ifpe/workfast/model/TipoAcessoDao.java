package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class TipoAcessoDao {

	private static final String PERSISTENCE_UNIT = "workfast";

	// Método para listar as opçoes de usuário do site
	public List<TipoAcesso> listar() {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		List<TipoAcesso> lista = manager.createQuery("FROM TipoAcesso ORDER BY descricao").getResultList();
		manager.close();
		factory.close();

		return lista;
	}

	public TipoAcesso buscarPorId(int id) {
		TipoAcesso obj = null;
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(TipoAcesso.class, id);
		manager.close();
		factory.close();

		return obj;
	}

}
