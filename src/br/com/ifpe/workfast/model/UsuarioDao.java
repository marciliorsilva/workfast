package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
	
public class UsuarioDao {

	private static final String PERSISTENCE_UNIT = "workfast";

	public Usuario buscarUsuario(Usuario usuario) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = manager.createQuery("FROM Usuario WHERE email LIKE :paramLogin AND senha LIKE :paramSenha");
		query.setParameter("paramLogin", usuario.getEmail());
		query.setParameter("paramSenha", usuario.getSenha());
		
		List<Usuario> registros = query.getResultList();
		Usuario obj = null;
		
		if (!registros.isEmpty()) {
			obj = (Usuario) registros.get(0);
		}
		
		manager.close();
		factory.close();
		return obj;
	}

	//Método para incluir o usuário
	public void salvar(Usuario usuario) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(usuario);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}
	
	
	//Método para buscar verificar se o e-mail já existe no banco de dados
	public Usuario buscarPorEmail(String email){

		Usuario obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Usuario WHERE email = :paramEmail");
		query.setParameter("paramEmail", email);

		try{
			obj = (Usuario) query.getSingleResult();
		}catch(NoResultException nre){
			return null;
		}
		
		manager.close();
		factory.close();
		return obj;
		
	}

   
	
	// listar  usuarios do tipo; cliente
	public List<Usuario> listarUsuarioCliente() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Usuario u WHERE u.tipo_acesso.descricao = :paramTipo ORDER BY nome");
		query.setParameter("paramTipo", "Cliente");
		List<Usuario> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
		}
	

	public Usuario buscarPorId(int id) {
		Usuario obj = null;
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Usuario.class, id);
		manager.close();
		factory.close();

		return obj;
	}
	 
	// listar  usuarios do tipo; administrador
	public List<Usuario> listarUsuarioAdm(Usuario usuario) {
			EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
			EntityManager manager = factory.createEntityManager();
			Query query = null;
			
			switch(usuario.getNivel_acesso()) {	
			  case "0":
				query = manager.createQuery("FROM Usuario u WHERE u.tipo_acesso.descricao = :paramTipo AND u.id NOT IN (:paramId) ORDER BY nome");
				query.setParameter("paramTipo", "Administrador");
				query.setParameter("paramId", usuario.getIdUsuario());
				
			  break;
			  
			  case "1":
				  query = manager.createQuery("FROM Usuario u WHERE u.tipo_acesso.descricao = :paramTipo AND u.id NOT IN (:paramId) AND u.nivel_acesso NOT IN (0,1) ORDER BY nome");
				  query.setParameter("paramTipo", "Administrador");
				  query.setParameter("paramId", usuario.getIdUsuario());
				  
		      break;
		      			  
			  default:
				  query = null;
			  break;
			}
			
			
			
			List<Usuario> lista = query.getResultList();
			manager.close();
			factory.close();
			return lista;
	}
	
	 
	// listar  usuarios do tipo; prestador
	public List<Usuario> listarUsuarioPrestador() {
		EntityManagerFactory factory =  Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Usuario u WHERE u.tipo_acesso.descricao  = :paramTipo ORDER BY nome");
		query.setParameter("paramTipo", "Prestador de Servico");
		List<Usuario> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}
	
	public void alterar(Usuario usuario) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.merge(usuario);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}
	
	public void remover(int id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Usuario usuario = manager.find(Usuario.class, id);

		manager.getTransaction().begin();
		manager.remove(usuario);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	
}
