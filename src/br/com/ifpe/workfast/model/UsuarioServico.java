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
@Table(name = "usuario_servico")
public class UsuarioServico {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int idUsuarioServico;
	
	@ManyToOne
	@JoinColumn(name = "fk_servico")
	private Servico servico;
	
	@ManyToOne
	@JoinColumn(name = "fk_usuario")
	private Usuario usuario;
	
	@Column
	private String descricao;

	public int getIdUsuarioServico() {
		return idUsuarioServico;
	}

	public void setIdUsuarioServico(int idUsuarioServico) {
		this.idUsuarioServico = idUsuarioServico;
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	
	
	

}
