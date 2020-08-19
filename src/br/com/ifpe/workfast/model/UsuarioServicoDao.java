package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class UsuarioServicoDao {
	
protected static final String PERSISTENCE_UNIT = "workfast";
	
	public UsuarioServico salvar(UsuarioServico obj) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
	
		manager.persist(obj);
		UsuarioServico usuarioServico = obj;
		manager.getTransaction().commit();

		manager.close();
		factory.close();
		
		return usuarioServico;
		
	}

	
	public UsuarioServico buscarPorId(int id) {

		UsuarioServico obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(UsuarioServico.class, id);
		manager.close();
		factory.close();

		return obj;
	}
	
	public List<UsuarioServico> listarServicosUsuario(int id) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM UsuarioServico us WHERE us.usuario.idUsuario = :paramId");
		query.setParameter("paramId", id);
		List<UsuarioServico> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}
	
	public boolean existeVinculacao(int idUsuario, int idServico){

		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM UsuarioServico WHERE usuario.idUsuario =:paramUsuario AND servico.idServico =:paramServico");
		query.setParameter("paramUsuario", idUsuario);
		query.setParameter("paramServico", idServico);

		try{
			query.getSingleResult();
		}catch(NoResultException nre){
			return false;
		}
		
		manager.close();
		factory.close();
		return true ;
		
	}
	
	
	
	public void alterar(UsuarioServico usuarioServico) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.merge(usuarioServico);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	

	public void remover(int id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		UsuarioServico usuarioServico = manager.find(UsuarioServico.class, id);

		manager.getTransaction().begin();
		manager.remove(usuarioServico);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}


}
