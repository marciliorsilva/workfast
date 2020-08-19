package br.com.ifpe.workfast.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "cidade_atuacao_servico")
public class CidadeAtuacaoServico {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int idAtuacaoServico;
	
	@ManyToOne
	@JoinColumn(name = "fk_usuarioServico")
	private UsuarioServico usuarioServico;
	
	@ManyToOne
	@JoinColumn(name = "fk_cidade")
	private Cidade cidade;
	
	

	
	public int getIdAtuacaoServico() {
		return idAtuacaoServico;
	}

	public void setIdAtuacaoServico(int idAtuacaoServico) {
		this.idAtuacaoServico = idAtuacaoServico;
	}

	public UsuarioServico getUsuarioServico() {
		return usuarioServico;
	}

	public void setUsuarioServico(UsuarioServico usuarioServico) {
		this.usuarioServico = usuarioServico;
	}

	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}
	
	
}
