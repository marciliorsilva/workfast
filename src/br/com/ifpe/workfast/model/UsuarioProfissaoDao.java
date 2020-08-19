package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class UsuarioProfissaoDao {

	private static final String PERSISTENCE_UNIT = "workfast";
	
	//Método para cadastra a vinculação entre usuário e profissao
		public void salvar(UsuarioProfissao usuarioProfissao) {
			EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
			EntityManager manager = factory.createEntityManager();
			manager.getTransaction().begin();
			manager.persist(usuarioProfissao);
			manager.getTransaction().commit();
			manager.close();
			factory.close();
		}
		
		public UsuarioProfissao buscarPorId(int id) {

			UsuarioProfissao obj = null;

			EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
			EntityManager manager = factory.createEntityManager();
			obj = manager.find(UsuarioProfissao.class, id);
			manager.close();
			factory.close();

			return obj;
		}
		
		public List<UsuarioProfissao> listarProfissaoUsuario(int id) {
			EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
			EntityManager manager = factory.createEntityManager();
			Query query = null;
			query = manager.createQuery("FROM UsuarioProfissao up WHERE up.usuario.idUsuario = :paramId");
			query.setParameter("paramId", id);
			List<UsuarioProfissao> lista = query.getResultList();
			manager.close();
			factory.close();
			return lista;
		}
		
		public boolean existeVinculacao(int idUsuario, int idProfissao){

			
			EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
			EntityManager manager = factory.createEntityManager();
			Query query = null;
			query = manager.createQuery("FROM UsuarioProfissao WHERE usuario.idUsuario =:paramUsuario AND profissao.idProfissao =:paramProfissao");
			query.setParameter("paramUsuario", idUsuario);
			query.setParameter("paramProfissao", idProfissao);

			try{
				query.getSingleResult();
			}catch(NoResultException nre){
				return false;
			}
			
			manager.close();
			factory.close();
			return true ;
			
		}
		
		
		
		public void alterar(UsuarioProfissao usuarioProfissao) {

			EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
			EntityManager manager = factory.createEntityManager();

			manager.getTransaction().begin();
			manager.merge(usuarioProfissao);
			manager.getTransaction().commit();

			manager.close();
			factory.close();
		}

		

		public void remover(int id) {

			EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
			EntityManager manager = factory.createEntityManager();
			UsuarioProfissao usuarioProfissao = manager.find(UsuarioProfissao.class, id);

			manager.getTransaction().begin();
			manager.remove(usuarioProfissao);
			manager.getTransaction().commit();

			manager.close();
			factory.close();
		}

}
