package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class EnderecoDao {

	private static final String PERSISTENCE_UNIT = "workfast";

	// Método para buscar endereco do prestador
	public Endereco buscarEnderecoUsuarioPrestador(int idUsuario) {

		Endereco obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery(
				"FROM Endereco WHERE usuario.idUsuario = :paramId AND usuario.tipo_acesso.descricao LIKE :paramTipo");
		query.setParameter("paramId", idUsuario);
		query.setParameter("paramTipo", "Prestador de servico");

		try {
			obj = (Endereco) query.getSingleResult();
		} catch (NoResultException nre) {
			return null;
		}

		manager.close();
		factory.close();
		return obj;

	}

	// Método para buscar endereco do usuario
	public Endereco buscarEnderecoUsuario(int idUsuario) {

		Endereco obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Endereco WHERE usuario.idUsuario = :paramId");
		query.setParameter("paramId", idUsuario);

		try {
			obj = (Endereco) query.getSingleResult();
		} catch (NoResultException nre) {
			return null;
		}

		manager.close();
		factory.close();
		return obj;

	}

	// Método para incluir o endereco do usuario
	public void salvarEndereco(Endereco endereco) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(endereco);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

	// Método que fará a alteração do Endereco
	public void alterar(Endereco endereco) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.merge(endereco);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	// Método que fará remoção do objeto
	public void remover(int id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Endereco endereco = manager.find(Endereco.class, id);

		manager.getTransaction().begin();
		manager.remove(endereco);

		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

	// Método para buscar verificar se o cliente já tem os dados pessoais
	// cadastrados
	public List<Endereco> listarEnderecoCliente(int idUsuario) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Endereco WHERE usuario.idUsuario = :paramId");
		query.setParameter("paramId", idUsuario);
		List<Endereco> lista = query.getResultList();

		manager.close();
		factory.close();
		return lista;

	}

	// Método que busca o endereço para alterar
	public Endereco buscarPorId(int id) {
		Endereco obj = null;
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		obj = manager.find(Endereco.class, id);
		manager.close();
		factory.close();

		return obj;
	}

}
