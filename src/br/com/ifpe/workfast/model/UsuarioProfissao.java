package br.com.ifpe.workfast.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "profissao_usuario")
public class UsuarioProfissao {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int idProfissaoUsuario;
	
	@ManyToOne
	@JoinColumn(name = "fk_usuario")
	private Usuario usuario;
	
	@ManyToOne
	@JoinColumn(name = "fk_profissao")
	private Profissao profissao;
	
	public int getIdProfissaoUsuario() {
		return idProfissaoUsuario;
	}

	public void setIdProfissaoUsuario(int idProfissaoUsuario) {
		this.idProfissaoUsuario = idProfissaoUsuario;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Profissao getProfissao() {
		return profissao;
	}

	public void setProfissao(Profissao profissao) {
		this.profissao = profissao;
	}

	
	
	

}
