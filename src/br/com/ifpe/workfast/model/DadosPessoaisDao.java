package br.com.ifpe.workfast.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class DadosPessoaisDao {

	private static final String PERSISTENCE_UNIT = "workfast";

	// Método para buscar verificar se o usuario já tem os dados pessoais
	// cadastrados
	public DadosPessoais buscarDadosPessoaisUsuario(int idUsuario) {

		DadosPessoais obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM DadosPessoais WHERE usuario.idUsuario = :paramId");
		query.setParameter("paramId", idUsuario);

		try {
			obj = (DadosPessoais) query.getSingleResult();
		} catch (NoResultException nre) {
			return null;
		}

		manager.close();
		factory.close();
		return obj;

	}

	// Método para incluir os dadosPessoais do usuario
	public void salvar(DadosPessoais dadosPessoais) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(dadosPessoais);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

	public void alterar(DadosPessoais dados) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.merge(dados);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	// Método para buscar verificar se o cpf já existe no banco de dados
	public DadosPessoais buscarPorCpfCnpjCliente(String cpf) {

		DadosPessoais obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;

		query = manager.createQuery(
				"FROM DadosPessoais dp WHERE dp.cpfCnpj = :paramCpf AND dp.usuario.tipo_acesso.idTipoAcesso = :paramTipo");
		query.setParameter("paramCpf", cpf);
		query.setParameter("paramTipo", 1);

		try {
			obj = (DadosPessoais) query.getSingleResult();
		} catch (NoResultException nre) {
			return null;
		}

		manager.close();
		factory.close();
		return obj;

	}

	// Método para buscar verificar se o RG já existe no banco de dados
	public DadosPessoais buscarPorRgIeCliente(String rg) {

		DadosPessoais obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;

		query = manager.createQuery(
				"FROM DadosPessoais dp WHERE dp.rgIe = :paramRg AND dp.usuario.tipo_acesso.idTipoAcesso = :paramTipo");
		query.setParameter("paramRg", rg);
		query.setParameter("paramTipo", 1);

		try {
			obj = (DadosPessoais) query.getSingleResult();
		} catch (NoResultException nre) {
			return null;
		}

		manager.close();
		factory.close();
		return obj;

	}

	// Método para buscar verificar se o cpf já existe no banco de dados
	public DadosPessoais buscarPorCpfCnpjPrestador(String cpf) {

		DadosPessoais obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;

		query = manager.createQuery(
				"FROM DadosPessoais dp WHERE dp.cpfCnpj = :paramCpf AND dp.usuario.tipo_acesso.idTipoAcesso = :paramTipo");
		query.setParameter("paramCpf", cpf);
		query.setParameter("paramTipo", 3);

		try {
			obj = (DadosPessoais) query.getSingleResult();
		} catch (NoResultException nre) {
			return null;
		}

		manager.close();
		factory.close();
		return obj;

	}

	// Método para buscar verificar se o RG já existe no banco de dados
	public DadosPessoais buscarPorRgIePrestador(String rg) {

		DadosPessoais obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;

		query = manager.createQuery(
				"FROM DadosPessoais dp WHERE dp.rgIe = :paramRg AND dp.usuario.tipo_acesso.idTipoAcesso = :paramTipo");
		query.setParameter("paramRg", rg);
		query.setParameter("paramTipo", 3);

		try {
			obj = (DadosPessoais) query.getSingleResult();
		} catch (NoResultException nre) {
			return null;
		}

		manager.close();
		factory.close();
		return obj;

	}

}
